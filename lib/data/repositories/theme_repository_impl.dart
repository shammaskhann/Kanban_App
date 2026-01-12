import 'package:kanban_app/data/data_soruces/local/theme_local_data_source.dart';
import 'package:kanban_app/domain/irepositories/i_theme_repository.dart';

import '../../domain/entities/theme_entity.dart';

class ThemeRepositoryImpl implements IThemeRepository {
  final LocalDataSource localDataSource;

  ThemeRepositoryImpl({required this.localDataSource});

  @override
  Future<AppTheme> getTheme() async {
    return await localDataSource.getTheme();
  }

  @override
  Future<void> setTheme(AppTheme theme) async {
    await localDataSource.setTheme(theme);
  }

  @override
  Stream<AppTheme> watchTheme() {
    return localDataSource.watchTheme();
  }
}
