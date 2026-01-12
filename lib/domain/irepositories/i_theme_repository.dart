import '../entities/theme_entity.dart';

abstract class IThemeRepository {
  Future<AppTheme> getTheme();
  Future<void> setTheme(AppTheme theme);
  Stream<AppTheme> watchTheme();
}
