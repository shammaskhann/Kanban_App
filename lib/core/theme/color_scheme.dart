import 'package:flutter/material.dart';
import 'package:kanban_app/core/constants/app_color.dart';

class AppColorScheme {
  final Brightness brightness;
  final Color primary;
  final Color primaryContainer;
  final Color secondary;
  final Color secondaryContainer;
  final Color surface;
  final Color surfaceVariant;
  final Color background;
  final Color error;
  final Color onPrimary;
  final Color onSecondary;
  final Color onSurface;
  final Color onBackground;
  final Color onError;
  final Color shadow;
  final Color outline;
  final Color outlineVariant;

  // Kanban-specific colors
  final Color columnBackground;
  final Color cardBackground;
  final Color divider;
  final Color hoverColor;
  final Color dragTargetColor;
  final Color selectedColor;

  // Text colors
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;
  final Color textInverse;

  // Column colors
  final Color columnTodo;
  final Color columnInProgress;
  final Color columnReview;
  final Color columnDone;

  // Tag colors
  final Color tagUrgent;
  final Color tagHigh;
  final Color tagMedium;
  final Color tagLow;
  final Color tagFeature;
  final Color tagBug;

  AppColorScheme.light()
    : brightness = Brightness.light,
      primary = AppColors.primary,
      primaryContainer = AppColors.primaryLight,
      secondary = AppColors.secondary,
      secondaryContainer = AppColors.secondaryLight,
      surface = const Color.fromARGB(255, 255, 255, 255),
      surfaceVariant = AppColors.lightSurfaceVariant,
      background = AppColors.lightBackground,
      error = AppColors.error,
      onPrimary = AppColors.white,
      onSecondary = AppColors.white,
      onSurface = AppColors.lightPrimaryText,
      onBackground = AppColors.lightPrimaryText,
      onError = AppColors.white,
      shadow = const Color(0x1A000000),
      outline = AppColors.lightBorder,
      outlineVariant = const Color(0xFFC4C7C5),
      columnBackground = AppColors.lightSurfaceVariant,
      cardBackground = AppColors.lightSurface,
      divider = AppColors.lightDivider,
      hoverColor = const Color(0x0A000000),
      dragTargetColor = AppColors.primary.withOpacity(0.1),
      selectedColor = AppColors.primary.withOpacity(0.15),
      textPrimary = AppColors.lightPrimaryText,
      textSecondary = AppColors.lightSecondaryText,
      textDisabled = AppColors.lightDisabledText,
      textInverse = AppColors.white,
      columnTodo = AppColors.todoColumn,
      columnInProgress = AppColors.inProgressColumn,
      columnReview = AppColors.reviewColumn,
      columnDone = AppColors.doneColumn,
      tagUrgent = AppColors.tagUrgent,
      tagHigh = AppColors.tagHigh,
      tagMedium = AppColors.tagMedium,
      tagLow = AppColors.tagLow,
      tagFeature = AppColors.tagFeature,
      tagBug = AppColors.tagBug;

  AppColorScheme.dark()
    : brightness = Brightness.dark,
      primary = AppColors.primaryLight,
      primaryContainer = AppColors.primaryDark,
      secondary = AppColors.secondaryLight,
      secondaryContainer = AppColors.secondary,
      surface = const Color.fromARGB(255, 22, 22, 22),
      surfaceVariant = AppColors.darkSurfaceVariant,
      background = AppColors.darkBackground,
      error = AppColors.error,
      onPrimary = AppColors.white,
      onSecondary = AppColors.white,
      onSurface = AppColors.darkPrimaryText,
      onBackground = AppColors.darkPrimaryText,
      onError = AppColors.white,
      shadow = const Color(0x33000000),
      outline = AppColors.darkBorder,
      outlineVariant = const Color(0xFF414941),
      columnBackground = AppColors.darkSurfaceVariant,
      cardBackground = AppColors.darkSurface,
      divider = AppColors.darkDivider,
      hoverColor = const Color(0x0AFFFFFF),
      dragTargetColor = AppColors.primaryLight.withOpacity(0.1),
      selectedColor = AppColors.primaryLight.withOpacity(0.15),
      textPrimary = AppColors.darkPrimaryText,
      textSecondary = AppColors.darkSecondaryText,
      textDisabled = AppColors.darkDisabledText,
      textInverse = AppColors.black,
      columnTodo = AppColors.todoColumn,
      columnInProgress = AppColors.inProgressColumn,
      columnReview = AppColors.reviewColumn,
      columnDone = AppColors.doneColumn,
      tagUrgent = AppColors.tagUrgent,
      tagHigh = AppColors.tagHigh,
      tagMedium = AppColors.tagMedium,
      tagLow = AppColors.tagLow,
      tagFeature = AppColors.tagFeature,
      tagBug = AppColors.tagBug;
}
