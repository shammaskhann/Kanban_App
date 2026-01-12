import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/core/enums/TaskStatus.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/domain/entities/theme_entity.dart';
import 'package:kanban_app/domain/irepositories/i_task_repository.dart';
import 'package:kanban_app/domain/irepositories/i_theme_repository.dart';
import 'package:kanban_app/domain/usecases/tasks/create_task.dart';
import 'package:kanban_app/domain/usecases/tasks/delete_task.dart';
import 'package:kanban_app/domain/usecases/tasks/get_tasks.dart';
import 'package:kanban_app/domain/usecases/tasks/update_task.dart';
import 'package:kanban_app/domain/usecases/theme/get_theme.dart';
import 'package:kanban_app/domain/usecases/theme/set_theme.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Generate mocks
@GenerateMocks([ITaskRepository, IThemeRepository])
import 'usecases_test.mocks.dart';

void main() {
  late MockITaskRepository mockTaskRepository;
  late MockIThemeRepository mockThemeRepository;

  setUp(() {
    mockTaskRepository = MockITaskRepository();
    mockThemeRepository = MockIThemeRepository();
  });

  group('Task Usecases', () {
    group('CreateTask', () {
      test('should call repository.createTask and return TaskEntity', () async {
        // ARRANGE
        const tContent = "New Task";
        final tTask = TaskEntity(
          id: '1',
          content: tContent,
          status: TaskStatus.todo,
          commentCount: 0,
          deadline: '',
          createdAt: '',
          duration: 0,
        );

        when(
          mockTaskRepository.createTask(content: anyNamed('content')),
        ).thenAnswer((_) async => tTask);

        final usecase = CreateTask(mockTaskRepository);

        // ACT
        final result = await usecase.call(content: tContent);

        // ASSERT
        expect(result, tTask);
        verify(mockTaskRepository.createTask(content: tContent));
        verifyNoMoreInteractions(mockTaskRepository);
      });
    });

    group('UpdateTask', () {
      test('should call repository.updateTask with all parameters', () async {
        // ARRANGE
        const tTaskId = '123';
        const tContent = 'Updated Task';
        const tStatus = TaskStatus.inProgress;
        const tDuration = 60;

        when(
          mockTaskRepository.updateTask(
            taskId: anyNamed('taskId'),
            content: anyNamed('content'),
            status: anyNamed('status'),
            duration: anyNamed('duration'),
          ),
        ).thenAnswer((_) async => Future.value());

        final usecase = UpdateTask(mockTaskRepository);

        // ACT
        await usecase.call(
          taskId: tTaskId,
          content: tContent,
          status: tStatus,
          duration: tDuration,
        );

        // ASSERT
        verify(
          mockTaskRepository.updateTask(
            taskId: tTaskId,
            content: tContent,
            status: tStatus,
            duration: tDuration,
          ),
        );
        verifyNoMoreInteractions(mockTaskRepository);
      });

      test('should call repository.updateTask with only taskId', () async {
        // ARRANGE
        const tTaskId = '123';

        when(
          mockTaskRepository.updateTask(
            taskId: anyNamed('taskId'),
            content: anyNamed('content'),
            status: anyNamed('status'),
            duration: anyNamed('duration'),
          ),
        ).thenAnswer((_) async => Future.value());

        final usecase = UpdateTask(mockTaskRepository);

        // ACT
        await usecase.call(taskId: tTaskId);

        // ASSERT
        verify(
          mockTaskRepository.updateTask(
            taskId: tTaskId,
            content: null,
            status: null,
            duration: null,
          ),
        );
      });
    });

    group('DeleteTask', () {
      test('should call repository.deleteTask', () async {
        // ARRANGE
        const tId = '123';
        when(
          mockTaskRepository.deleteTask(any),
        ).thenAnswer((_) async => Future.value());

        final usecase = DeleteTask(mockTaskRepository);

        // ACT
        await usecase.call(tId);

        // ASSERT
        verify(mockTaskRepository.deleteTask(tId));
      });
    });

    group('GetTasks', () {
      test('should call repository.fetchAllTasks', () async {
        // ARRANGE
        when(mockTaskRepository.fetchAllTasks()).thenAnswer((_) async => []);

        final usecase = GetTasks(mockTaskRepository);

        // ACT
        await usecase.call();

        // ASSERT
        verify(mockTaskRepository.fetchAllTasks());
      });

      test('should return list of tasks from repository', () async {
        // ARRANGE
        final tTasks = [
          TaskEntity(
            id: '1',
            content: 'Task 1',
            status: TaskStatus.todo,
            commentCount: 0,
            deadline: '',
            createdAt: '',
            duration: 0,
          ),
          TaskEntity(
            id: '2',
            content: 'Task 2',
            status: TaskStatus.done,
            commentCount: 0,
            deadline: '',
            createdAt: '',
            duration: 30,
          ),
        ];

        when(
          mockTaskRepository.fetchAllTasks(),
        ).thenAnswer((_) async => tTasks);

        final usecase = GetTasks(mockTaskRepository);

        // ACT
        final result = await usecase.call();

        // ASSERT
        expect(result, tTasks);
        expect(result.length, 2);
      });
    });
  });

  group('Theme Usecases', () {
    group('GetTheme', () {
      test(
        'should call repository.getTheme and return AppTheme.light',
        () async {
          // ARRANGE
          when(
            mockThemeRepository.getTheme(),
          ).thenAnswer((_) async => AppTheme.light);

          final usecase = GetTheme(mockThemeRepository);

          // ACT
          final result = await usecase.call();

          // ASSERT
          expect(result, AppTheme.light);
          verify(mockThemeRepository.getTheme());
          verifyNoMoreInteractions(mockThemeRepository);
        },
      );

      test(
        'should call repository.getTheme and return AppTheme.dark',
        () async {
          // ARRANGE
          when(
            mockThemeRepository.getTheme(),
          ).thenAnswer((_) async => AppTheme.dark);

          final usecase = GetTheme(mockThemeRepository);

          // ACT
          final result = await usecase.call();

          // ASSERT
          expect(result, AppTheme.dark);
          verify(mockThemeRepository.getTheme());
        },
      );
    });

    group('SetTheme', () {
      test('should call repository.setTheme with AppTheme.dark', () async {
        // ARRANGE
        when(
          mockThemeRepository.setTheme(any),
        ).thenAnswer((_) async => Future.value());

        final usecase = SetTheme(mockThemeRepository);

        // ACT
        await usecase.call(AppTheme.dark);

        // ASSERT
        verify(mockThemeRepository.setTheme(AppTheme.dark));
        verifyNoMoreInteractions(mockThemeRepository);
      });

      test('should call repository.setTheme with AppTheme.light', () async {
        // ARRANGE
        when(
          mockThemeRepository.setTheme(any),
        ).thenAnswer((_) async => Future.value());

        final usecase = SetTheme(mockThemeRepository);

        // ACT
        await usecase.call(AppTheme.light);

        // ASSERT
        verify(mockThemeRepository.setTheme(AppTheme.light));
      });
    });
  });
}
