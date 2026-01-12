import 'package:kanban_app/domain/entities/theme_entity.dart';
import 'package:kanban_app/domain/irepositories/i_theme_repository.dart';

class SetTheme {
  final IThemeRepository repository;

  SetTheme(this.repository);

  Future<void> call(AppTheme theme) async {
    await repository.setTheme(theme);
  }
}
