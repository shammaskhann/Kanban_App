import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kanban_app/domain/entities/theme_entity.dart';
import 'package:kanban_app/domain/usecases/theme/get_theme.dart';
import 'package:kanban_app/domain/usecases/theme/set_theme.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final GetTheme getThemeUseCase;
  final SetTheme setThemeUseCase;

  ThemeCubit({required this.getThemeUseCase, required this.setThemeUseCase})
    : super(const ThemeState.initial()) {
    _loadTheme();
  }

  AppTheme _getThemeFromState(ThemeState state) {
    return state.when(
      initial: () => AppTheme.light,
      loaded: (theme) => theme,
      error: (theme, _) => theme,
    );
  }

  // Load theme from storage
  Future<void> _loadTheme() async {
    try {
      final theme = await getThemeUseCase();
      emit(ThemeState.loaded(theme));
    } catch (e) {
      emit(ThemeState.error(AppTheme.light, e.toString()));
    }
  }

  // Change theme to specific mode
  Future<void> changeTheme(AppTheme theme) async {
    try {
      await setThemeUseCase(theme);
      emit(ThemeState.loaded(theme));
    } catch (e) {
      final currentTheme = _getThemeFromState(state);
      emit(ThemeState.error(currentTheme, e.toString()));
    }
  }

  // Toggle between light and dark
  Future<void> toggleTheme() async {
    try {
      final currentTheme = _getThemeFromState(state);
      final newTheme = currentTheme == AppTheme.light
          ? AppTheme.dark
          : AppTheme.light;
      await setThemeUseCase(newTheme);
      emit(ThemeState.loaded(newTheme));
    } catch (e) {
      final currentTheme = _getThemeFromState(state);
      emit(ThemeState.error(currentTheme, e.toString()));
    }
  }

  // Get current theme
  AppTheme get currentTheme => _getThemeFromState(state);
}
