part of 'theme_cubit.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = _Initial;
  const factory ThemeState.loaded(AppTheme theme) = _Loaded;
  const factory ThemeState.error(AppTheme theme, String message) = _Error;
}
