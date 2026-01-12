import 'package:kanban_app/domain/irepositories/i_theme_repository.dart';

import '../../entities/theme_entity.dart';

class GetTheme {
  final IThemeRepository repository;

  GetTheme(this.repository);

  Future<AppTheme> call() async {
    return await repository.getTheme();
  }
}
