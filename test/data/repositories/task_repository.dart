import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/data/data_soruces/local/theme_local_data_source.dart';
import 'package:kanban_app/data/data_soruces/remote/remote_task_datasource.dart';
import 'package:kanban_app/data/model/task_model/task_model.dart';
import 'package:kanban_app/data/repositories/task_repository_impl.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Generate mocks
import 'task_repository.mocks.dart';

@GenerateMocks([RemoteTaskDatasource, LocalDataSource])
void main() {
  late TaskRepositoryImpl repository;
  late MockRemoteTaskDatasource mockRemote;
  late MockLocalDataSource mockLocal;

  setUp(() {
    mockRemote = MockRemoteTaskDatasource();
    mockLocal = MockLocalDataSource();
    repository = TaskRepositoryImpl(
      remoteTaskDatasource: mockRemote,
      localDataSource: mockLocal,
    );
  });

  group('TaskRepositoryImpl', () {
    group('fetchAllTasks', () {
      test('should merge remote tasks with local status data', () async {
        // ARRANGE
        // Remote returns Task A (status unknown from API)
        final tRemoteModel = TaskModel(
          id: '1',
          content: 'Remote Task',
          commentCount: 0,
          createdAt: '2023-01-01',
          deadline: null,
        );

        // Local returns Task A with status "completed"
        final tLocalEntity = TaskEntity(
          id: '1',
          content: 'Local Task',
          status: TaskStatus.done,
          commentCount: 0,
          deadline: '',
          createdAt: '2023-01-01',
          duration: 0,
        );

        when(mockRemote.fetchTasks()).thenAnswer((_) async => [tRemoteModel]);
        when(mockLocal.getTasks()).thenAnswer((_) async => [tLocalEntity]);

        // ACT
        final result = await repository.fetchAllTasks();

        // ASSERT
        expect(result.length, 1);
        expect(result.first.id, '1');
        // The repository logic replaces the remote content/status with local status
        expect(result.first.status, TaskStatus.done);
        verify(mockRemote.fetchTasks());
        verify(mockLocal.getTasks());
      });

      test('should handle empty local tasks', () async {
        // ARRANGE
        final tRemoteModel = TaskModel(
          id: '1',
          content: 'Remote Task',
          commentCount: 0,
          createdAt: '2023-01-01',
          deadline: null,
        );

        when(mockRemote.fetchTasks()).thenAnswer((_) async => [tRemoteModel]);
        when(mockLocal.getTasks()).thenAnswer((_) async => []);

        // ACT
        final result = await repository.fetchAllTasks();

        // ASSERT
        expect(result.length, 1);
        expect(result.first.status, TaskStatus.todo); // default status
      });
    });

    group('createTask', () {
      test('should create task remotely and save locally', () async {
        // ARRANGE
        const tContent = 'New Task';
        const tDuration = 60;

        final tCreatedModel = TaskModel(
          id: '2',
          content: tContent,
          commentCount: 0,
          createdAt: '2023-01-01',
          deadline: null,
          duration: tDuration,
        );

        when(
          mockRemote.createTask(content: anyNamed('content')),
        ).thenAnswer((_) async => tCreatedModel);

        when(mockLocal.addTask(any)).thenAnswer((_) async => Future.value());

        // ACT
        final result = await repository.createTask(
          content: tContent,
          duration: tDuration,
        );

        // ASSERT
        expect(result.id, '2');
        expect(result.content, tContent);
        expect(result.duration, tDuration);
        verify(mockRemote.createTask(content: tContent));
        verify(mockLocal.addTask(any));
      });

      test('should handle create with no duration', () async {
        // ARRANGE
        const tContent = 'Simple Task';

        final tCreatedModel = TaskModel(
          id: '3',
          content: tContent,
          commentCount: 0,
          createdAt: '2023-01-01',
          deadline: null,
        );

        when(
          mockRemote.createTask(content: anyNamed('content')),
        ).thenAnswer((_) async => tCreatedModel);

        when(mockLocal.addTask(any)).thenAnswer((_) async => Future.value());

        // ACT
        final result = await repository.createTask(content: tContent);

        // ASSERT
        expect(result.content, tContent);
        verify(mockRemote.createTask(content: tContent));
      });
    });

    group('updateTask', () {
      test('should update task remotely and locally', () async {
        // ARRANGE
        const tTaskId = '123';
        const tContent = 'Updated Content';
        const tStatus = TaskStatus.inProgress;
        const tDuration = 120;

        final tUpdatedModel = TaskModel(
          id: tTaskId,
          content: tContent,
          commentCount: 0,
          createdAt: '2023-01-01',
          deadline: null,
          duration: tDuration,
        );

        when(
          mockRemote.updateTask(
            taskId: anyNamed('taskId'),
            content: anyNamed('content'),
          ),
        ).thenAnswer((_) async => tUpdatedModel);

        when(
          mockLocal.updateTask(
            any,
            content: anyNamed('content'),
            status: anyNamed('status'),
            duration: anyNamed('duration'),
          ),
        ).thenAnswer((_) async => Future.value());

        // ACT
        await repository.updateTask(
          taskId: tTaskId,
          content: tContent,
          status: tStatus,
          duration: tDuration,
        );

        // ASSERT
        verify(mockRemote.updateTask(taskId: tTaskId, content: tContent));
        verify(
          mockLocal.updateTask(
            tTaskId,
            content: tContent,
            status: tStatus,
            duration: tDuration,
          ),
        );
      });

      test('should handle partial updates', () async {
        // ARRANGE
        const tTaskId = '123';
        const tStatus = TaskStatus.done;

        final tUpdatedModel = TaskModel(
          id: tTaskId,
          content: 'Existing Content',
          commentCount: 0,
          createdAt: '2023-01-01',
          deadline: null,
        );

        when(
          mockRemote.updateTask(
            taskId: anyNamed('taskId'),
            content: anyNamed('content'),
          ),
        ).thenAnswer((_) async => tUpdatedModel);

        when(
          mockLocal.updateTask(
            any,
            content: anyNamed('content'),
            status: anyNamed('status'),
            duration: anyNamed('duration'),
          ),
        ).thenAnswer((_) async => Future.value());

        // ACT
        await repository.updateTask(taskId: tTaskId, status: tStatus);

        // ASSERT
        verify(mockRemote.updateTask(taskId: tTaskId));
        verify(mockLocal.updateTask(tTaskId, status: tStatus));
      });
    });

    group('deleteTask', () {
      test('should delete from remote and then local', () async {
        // ARRANGE
        const tId = '123';
        when(
          mockRemote.deleteTask(any),
        ).thenAnswer((_) async => Future.value());
        when(mockLocal.deleteTask(any)).thenAnswer((_) async => Future.value());

        // ACT
        await repository.deleteTask(tId);

        // ASSERT
        verify(mockRemote.deleteTask(tId));
        verify(mockLocal.deleteTask(tId));
      });

      test('should propagate error when remote delete fails', () async {
        // ARRANGE
        const tId = '123';
        when(mockRemote.deleteTask(any)).thenThrow(Exception('Delete failed'));

        // ACT & ASSERT
        expect(() => repository.deleteTask(tId), throwsException);
      });
    });

    // Note: We mock LocalDataSource assuming it has deleteTask method.
    // If LocalDataSource interface changes, ensure MockLocalDataSource reflects it.
  });
}
