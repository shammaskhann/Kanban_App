enum AppTheme { light, dark }

extension AppThemeExtension on AppTheme {
  String get name {
    switch (this) {
      case AppTheme.light:
        return 'light';
      case AppTheme.dark:
        return 'dark';
    }
  }

  static AppTheme fromString(String value) {
    switch (value) {
      case 'light':
        return AppTheme.light;
      case 'dark':
        return AppTheme.dark;
      default:
        return AppTheme.light;
    }
  }
}
