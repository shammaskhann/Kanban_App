import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/data/data_soruces/remote/remote_task_datasource.dart';
import 'package:kanban_app/network/client/api_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:logger/logger.dart';

// Generate mocks: flutter pub run build_runner build
@GenerateMocks([DioClient, Logger])
import 'remote_task_datasrouce.mocks.dart';

void main() {
  late RemoteTaskDatasource dataSource;
  late MockDioClient mockClient;
  late MockLogger mockLogger;

  setUp(() {
    mockClient = MockDioClient();
    mockLogger = MockLogger();
    dataSource = RemoteTaskDatasource(
      apiClient: mockClient,
      logger: mockLogger,
    );
  });

  group('RemoteTaskDatasource', () {
    group('fetchTasks', () {
      test('should call client.get and return list of tasks', () async {
        // ARRANGE
        final List<Map<String, dynamic>> tResponse = [
          {
            'id': '1',
            'content': 'Test Task',
            'comment_count': 0,
            'created_at': '2023-01-01',
          },
        ];

        when(
          mockClient.get(any, queryParameters: anyNamed('queryParameters')),
        ).thenAnswer((_) async => tResponse);

        // ACT
        final result = await dataSource.fetchTasks();

        // ASSERT
        verify(mockClient.get('/tasks', queryParameters: null));
        expect(result, isA<List>());
        expect(result.length, 1);
        expect(result.first.content, 'Test Task');
      });

      test('should throw error when client.get fails', () async {
        // ARRANGE
        when(mockClient.get(any)).thenThrow(Exception('Network Error'));

        // ACT & ASSERT
        expect(() => dataSource.fetchTasks(), throwsException);
        verify(mockLogger.e(any));
      });
    });

    group('createTask', () {
      test('should post data and return TaskModel', () async {
        // ARRANGE
        final Map<String, dynamic> tResponse = {
          'id': '2',
          'content': 'New Task',
          'comment_count': 0,
          'duration': 60,
          'created_at': '2023-01-01',
        };

        when(
          mockClient.post(any, data: anyNamed('data')),
        ).thenAnswer((_) async => tResponse);

        // ACT
        final result = await dataSource.createTask(content: 'New Task');

        // ASSERT
        verify(
          mockClient.post(
            '/tasks',
            data: {'content': 'New Task', 'duration': 60},
          ),
        );
        expect(result.id, '2');
        expect(result.duration, 60);
      });

      test('should throw error when client.post fails', () async {
        // ARRANGE
        when(
          mockClient.post(any, data: anyNamed('data')),
        ).thenThrow(Exception('Network Error'));

        // ACT & ASSERT
        expect(
          () => dataSource.createTask(content: 'New Task'),
          throwsException,
        );
        verify(mockLogger.e(any));
      });
    });

    group('deleteTask', () {
      test('should call client.delete with taskId', () async {
        // ARRANGE
        const tTaskId = '123';
        when(mockClient.delete(any)).thenAnswer((_) async => {});

        // ACT
        await dataSource.deleteTask(tTaskId);

        // ASSERT
        verify(mockClient.delete('/tasks/$tTaskId'));
        verifyNoMoreInteractions(mockClient);
      });

      test('should throw error when client.delete fails', () async {
        // ARRANGE
        const tTaskId = '123';
        when(mockClient.delete(any)).thenThrow(Exception('Delete failed'));

        // ACT & ASSERT
        expect(() => dataSource.deleteTask(tTaskId), throwsException);
        verify(mockLogger.e(any));
      });
    });

    group('updateTask', () {
      test('should call client.post with taskId and data', () async {
        // ARRANGE
        const tTaskId = '123';
        const tContent = 'Updated Content';
        const tDuration = 90;

        final Map<String, dynamic> tResponse = {
          'id': tTaskId,
          'content': tContent,
          'duration': tDuration,
          'comment_count': 0,
          'created_at': '2023-01-01',
        };

        when(
          mockClient.post(any, data: anyNamed('data')),
        ).thenAnswer((_) async => tResponse);

        // ACT
        final result = await dataSource.updateTask(
          taskId: tTaskId,
          content: tContent,
        );

        // ASSERT
        verify(
          mockClient.post(
            '/tasks/$tTaskId',
            data: {'content': tContent, 'duration': tDuration},
          ),
        );

        expect(result.id, tTaskId);
        expect(result.content, tContent);
        expect(result.duration, tDuration);
      });

      test('should handle partial updates', () async {
        // ARRANGE
        const tTaskId = '123';
        const tContent = 'Updated Content';

        final Map<String, dynamic> tResponse = {
          'id': tTaskId,
          'content': tContent,
          'comment_count': 0,
          'created_at': '2023-01-01',
        };

        when(
          mockClient.post(any, data: anyNamed('data')),
        ).thenAnswer((_) async => tResponse);

        // ACT
        final result = await dataSource.updateTask(
          taskId: tTaskId,
          content: tContent,
        );

        // ASSERT
        verify(mockClient.post('/tasks/$tTaskId', data: {'content': tContent}));
        expect(result.content, tContent);
      });

      test('should throw error when client.post fails', () async {
        // ARRANGE
        const tTaskId = '123';
        when(
          mockClient.post(any, data: anyNamed('data')),
        ).thenThrow(Exception('Update failed'));

        // ACT & ASSERT
        expect(
          () => dataSource.updateTask(taskId: tTaskId, content: 'Test'),
          throwsException,
        );
        verify(mockLogger.e(any));
      });
    });
  });
}
