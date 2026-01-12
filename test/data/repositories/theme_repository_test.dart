import 'package:flutter_test/flutter_test.dart';
import 'package:kanban_app/data/data_soruces/local/theme_local_data_source.dart';
import 'package:kanban_app/data/repositories/theme_repository_impl.dart';
import 'package:kanban_app/domain/entities/theme_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Generate mocks
@GenerateMocks([LocalDataSource])
import 'theme_repository_test.mocks.dart';

void main() {
  late ThemeRepositoryImpl repository;
  late MockLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    repository = ThemeRepositoryImpl(localDataSource: mockLocalDataSource);
  });

  group('ThemeRepositoryImpl', () {
    group('getTheme', () {
      test('should return AppTheme.light from local data source', () async {
        // ARRANGE
        when(mockLocalDataSource.getTheme())
            .thenAnswer((_) async => AppTheme.light);

        // ACT
        final result = await repository.getTheme();

        // ASSERT
        expect(result, AppTheme.light);
        verify(mockLocalDataSource.getTheme());
        verifyNoMoreInteractions(mockLocalDataSource);
      });

      test('should return AppTheme.dark from local data source', () async {
        // ARRANGE
        when(mockLocalDataSource.getTheme())
            .thenAnswer((_) async => AppTheme.dark);

        // ACT
        final result = await repository.getTheme();

        // ASSERT
        expect(result, AppTheme.dark);
        verify(mockLocalDataSource.getTheme());
      });

      test('should propagate exception when local data source throws', () async {
        // ARRANGE
        when(mockLocalDataSource.getTheme())
            .thenThrow(Exception('Storage error'));

        // ACT & ASSERT
        expect(() => repository.getTheme(), throwsException);
        verify(mockLocalDataSource.getTheme());
      });
    });

    group('setTheme', () {
      test('should save AppTheme.dark to local data source', () async {
        // ARRANGE
        when(mockLocalDataSource.setTheme(any))
            .thenAnswer((_) async => Future.value());

        // ACT
        await repository.setTheme(AppTheme.dark);

        // ASSERT
        verify(mockLocalDataSource.setTheme(AppTheme.dark));
        verifyNoMoreInteractions(mockLocalDataSource);
      });

      test('should save AppTheme.light to local data source', () async {
        // ARRANGE
        when(mockLocalDataSource.setTheme(any))
            .thenAnswer((_) async => Future.value());

        // ACT
        await repository.setTheme(AppTheme.light);

        // ASSERT
        verify(mockLocalDataSource.setTheme(AppTheme.light));
      });

      test('should propagate exception when local data source throws', () async {
        // ARRANGE
        when(mockLocalDataSource.setTheme(any))
            .thenThrow(Exception('Storage error'));

        // ACT & ASSERT
        expect(() => repository.setTheme(AppTheme.dark), throwsException);
        verify(mockLocalDataSource.setTheme(AppTheme.dark));
      });
    });

    group('watchTheme', () {
      test('should return theme stream from local data source', () async {
        // ARRANGE
        final themeStream = Stream.value(AppTheme.light);
        when(mockLocalDataSource.watchTheme()).thenAnswer((_) => themeStream);

        // ACT
        final result = repository.watchTheme();

        // ASSERT
        expect(result, themeStream);
        verify(mockLocalDataSource.watchTheme());
      });

      test('should emit multiple theme changes', () async {
        // ARRANGE
        final themeStream = Stream.fromIterable([
          AppTheme.light,
          AppTheme.dark,
          AppTheme.light,
        ]);
        when(mockLocalDataSource.watchTheme()).thenAnswer((_) => themeStream);

        // ACT
        final result = repository.watchTheme();

        // ASSERT
        expect(
          result,
          emitsInOrder([AppTheme.light, AppTheme.dark, AppTheme.light]),
        );
      });
    });
  });
}
