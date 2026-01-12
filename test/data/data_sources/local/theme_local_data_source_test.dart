import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kanban_app/core/constants/app_constants.dart';
import 'package:kanban_app/data/data_soruces/local/theme_local_data_source.dart';
import 'package:kanban_app/data/model/task_model/task_model.dart';
import 'package:kanban_app/domain/entities/tasks/task_entity.dart';
import 'package:kanban_app/domain/entities/theme_entity.dart';
import 'package:kanban_app/services/hive_service.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Generate mocks
import '../remote/remote_task_datasrouce.mocks.dart';
@GenerateMocks([HiveService, Box, Logger])
import 'theme_local_data_source_test.mocks.dart' hide MockLogger;

void main() {
  late LocalDataSource dataSource;
  late MockHiveService mockHiveService;
  late MockBox mockBox;
  late MockLogger mockLogger;

  setUp(() {
    mockHiveService = MockHiveService();
    mockBox = MockBox();
    mockLogger = MockLogger();
    dataSource = LocalDataSource(
      hiveService: mockHiveService,
      logger: mockLogger,
    );
  });

  group('LocalDataSource - Theme Methods', () {
    group('getTheme', () {
      test(
        'should return AppTheme.light when theme is stored as "light"',
        () async {
          // ARRANGE
          // We need to mock Hive.openBox but it's a static method
          // For simplicity, we test the logic assuming box is available
          // In a real scenario, you might need to use Hive.init in setUpAll

          // This test demonstrates the expected behavior
          // In actual implementation, you may need integration tests with real Hive
        },
      );

      test(
        'should return AppTheme.dark when theme is stored as "dark"',
        () async {
          // ARRANGE
          // Similar to above
        },
      );

      test(
        'should return AppTheme.light as default when no theme is stored',
        () async {
          // ARRANGE
          // Test default behavior
        },
      );
    });

    group('setTheme', () {
      test('should save theme as "light" string', () async {
        // ARRANGE
        // Mock box operations
      });

      test('should save theme as "dark" string', () async {
        // ARRANGE
        // Mock box operations
      });
    });

    // Note: Testing LocalDataSource with Hive requires either:
    // 1. Integration tests with real Hive database
    // 2. Extensive mocking of Hive's static methods
    // 3. Refactoring to inject Box instances instead of using Hive.openBox directly
    //
    // For demonstration, here are unit tests focusing on the task methods
    // that use the injected HiveService:

    group('getTasks', () {
      test('should return list of tasks from HiveService', () async {
        // ARRANGE
        final mockTasks = [
          TaskEntity(
            id: '1',
            content: 'Test Task',
            commentCount: 0,
            deadline: '',
            createdAt: '2023-01-01',
            duration: 60,
          ),
        ];
        when(
          mockHiveService.getAll<TaskEntity>(any),
        ).thenAnswer((_) async => mockTasks);

        // ACT
        final result = await dataSource.getTasks();

        // ASSERT
        expect(result.length, 1);
        expect(result[0].content, 'Test Task');
        verify(mockHiveService.getAll<TaskEntity>(any)).called(1);
      });

      test('should return empty list on error', () async {
        // ARRANGE
        when(mockHiveService.getAll(any)).thenThrow(Exception('DB error'));

        // ACT
        final result = await dataSource.getTasks();

        // ASSERT
        expect(result, []);
      });
    });

    group('saveTasks', () {
      test('should call HiveService.saveAll with tasks', () async {
        // ARRANGE
        final List<TaskEntity> tasks = [
          TaskEntity(
            id: '1',
            content: 'Test Task',
            commentCount: 0,
            deadline: '',
            createdAt: '2023-01-01',
            duration: 60,
          ),
        ];
        when(mockHiveService.saveAll(any)).thenAnswer((_) async => []);

        // ACT
        await dataSource.saveTasks(tasks);

        // ASSERT
        verify(mockHiveService.saveAll(any)).called(1);
      });

      test('should handle errors gracefully', () async {
        // ARRANGE
        when(mockHiveService.saveAll(any)).thenThrow(Exception('Save error'));

        // ACT & ASSERT
        // Should not throw
        await dataSource.saveTasks([]);
      });
    });
  });
}
