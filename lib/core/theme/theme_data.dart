import 'package:flutter/material.dart';
import 'package:kanban_app/core/constants/app_style.dart';
import 'color_scheme.dart';

class AppThemeData {
  static ThemeData lightTheme() {
    final colorScheme = AppColorScheme.light();

    return ThemeData(
      useMaterial3: true,
      fontFamily: "Franie",
      brightness: colorScheme.brightness,
      colorScheme: ColorScheme(
        brightness: colorScheme.brightness,
        primary: colorScheme.primary,
        onPrimary: colorScheme.onPrimary,
        primaryContainer: colorScheme.primaryContainer,
        onPrimaryContainer: colorScheme.textPrimary,
        secondary: colorScheme.secondary,
        onSecondary: colorScheme.onSecondary,
        secondaryContainer: colorScheme.secondaryContainer,
        onSecondaryContainer: colorScheme.textPrimary,
        surface: colorScheme.surface,
        onSurface: colorScheme.onSurface,
        surfaceVariant: colorScheme.surfaceVariant,
        onSurfaceVariant: colorScheme.textSecondary,
        background: colorScheme.background,
        onBackground: colorScheme.onBackground,
        error: colorScheme.error,
        onError: colorScheme.onError,
        outline: colorScheme.outline,
        outlineVariant: colorScheme.outlineVariant,
      ),
      scaffoldBackgroundColor: colorScheme.background,
      cardColor: colorScheme.cardBackground,
      canvasColor: colorScheme.surface,
      shadowColor: colorScheme.shadow,
      dividerColor: colorScheme.divider,
      hoverColor: colorScheme.hoverColor,
      focusColor: colorScheme.primary.withOpacity(0.12),
      highlightColor: colorScheme.primary.withOpacity(0.2),
      splashColor: colorScheme.primary.withOpacity(0.2),
      disabledColor: colorScheme.textDisabled,

      // Text Theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: colorScheme.textPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: colorScheme.textPrimary,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: colorScheme.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: colorScheme.textSecondary,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: colorScheme.textPrimary,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: colorScheme.textSecondary,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: colorScheme.textSecondary,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: colorScheme.cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppStyles.borderRadiusCard,
          side: AppStyles.borderLight,
        ),
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.spacingL,
            vertical: AppStyles.spacingS,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppStyles.borderRadiusButton,
          ),
          elevation: 0,
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusM),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusM),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusM),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusM),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusM),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        contentPadding: const EdgeInsets.all(AppStyles.spacingM),
        hintStyle: TextStyle(color: colorScheme.textSecondary),
        labelStyle: TextStyle(color: colorScheme.textSecondary),
      ),
    );
  }

  static ThemeData darkTheme() {
    final colorScheme = AppColorScheme.dark();

    return ThemeData(
      useMaterial3: true,
      fontFamily: "Franie",
      brightness: colorScheme.brightness,
      colorScheme: ColorScheme(
        brightness: colorScheme.brightness,
        primary: colorScheme.primary,
        onPrimary: colorScheme.onPrimary,
        primaryContainer: colorScheme.primaryContainer,
        onPrimaryContainer: colorScheme.textPrimary,
        secondary: colorScheme.secondary,
        onSecondary: colorScheme.onSecondary,
        secondaryContainer: colorScheme.secondaryContainer,
        onSecondaryContainer: colorScheme.textPrimary,
        surface: colorScheme.surface,
        onSurface: colorScheme.onSurface,
        surfaceVariant: colorScheme.surfaceVariant,
        onSurfaceVariant: colorScheme.textSecondary,
        background: colorScheme.background,
        onBackground: colorScheme.onBackground,
        error: colorScheme.error,
        onError: colorScheme.onError,
        outline: colorScheme.outline,
        outlineVariant: colorScheme.outlineVariant,
      ),
      scaffoldBackgroundColor: colorScheme.background,
      cardColor: colorScheme.cardBackground,
      canvasColor: colorScheme.surface,
      shadowColor: colorScheme.shadow,
      dividerColor: colorScheme.divider,
      hoverColor: colorScheme.hoverColor,
      focusColor: colorScheme.primary.withOpacity(0.12),
      highlightColor: colorScheme.primary.withOpacity(0.2),
      splashColor: colorScheme.primary.withOpacity(0.2),
      disabledColor: colorScheme.textDisabled,

      // Text Theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: colorScheme.textPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: colorScheme.textPrimary,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: colorScheme.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colorScheme.textPrimary,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: colorScheme.textSecondary,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: colorScheme.textPrimary,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: colorScheme.textSecondary,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: colorScheme.textSecondary,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: colorScheme.cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppStyles.borderRadiusCard,
          side: AppStyles.borderDark,
        ),
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppStyles.spacingL,
            vertical: AppStyles.spacingS,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppStyles.borderRadiusButton,
          ),
          elevation: 0,
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusM),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusM),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusM),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusM),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusM),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        contentPadding: const EdgeInsets.all(AppStyles.spacingM),
        hintStyle: TextStyle(color: colorScheme.textSecondary),
        labelStyle: TextStyle(color: colorScheme.textSecondary),
      ),
    );
  }
}
