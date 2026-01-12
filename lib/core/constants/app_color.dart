import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors (Brand Color - Suitable for Kanban)
  static const Color primary = Color(0xFF4361EE); // Vibrant blue
  static const Color primaryLight = Color(0xFF4895EF);
  static const Color primaryDark = Color(0xFF3A0CA3);

  // Secondary Colors (For accents, labels, tags)
  static const Color secondary = Color(0xFF7209B7);
  static const Color secondaryLight = Color(0xFFB5179E);
  static const Color success = Color(0xFF4CC9F0);
  static const Color warning = Color(0xFFF72585);
  static const Color info = Color(0xFF560BAD);

  // Column Colors (Kanban columns)
  static const Color todoColumn = Color(0xFFF94144);
  static const Color inProgressColumn = Color(0xFFF8961E);
  static const Color reviewColumn = Color(0xFFF9C74F);
  static const Color doneColumn = Color(0xFF90BE6D);

  // Tag Colors (Task tags)
  static const Color tagUrgent = Color(0xFFFF6B6B);
  static const Color tagHigh = Color(0xFF4ECDC4);
  static const Color tagMedium = Color(0xFF45B7D1);
  static const Color tagLow = Color(0xFF96CEB4);
  static const Color tagFeature = Color(0xFFFECA57);
  static const Color tagBug = Color(0xFF54A0FF);

  // Neutral Colors (Light Theme)
  static const Color lightBackground = Color(0xFFF8F9FA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFE9ECEF);
  static const Color lightBorder = Color(0xFFDEE2E6);
  static const Color lightDivider = Color(0xFFE9ECEF);

  // Text Colors (Light Theme)
  static const Color lightPrimaryText = Color(0xFF212529);
  static const Color lightSecondaryText = Color(0xFF6C757D);
  static const Color lightDisabledText = Color(0xFFADB5BD);

  // Neutral Colors (Dark Theme)
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkSurfaceVariant = Color(0xFF252525);
  static const Color darkBorder = Color(0xFF373737);
  static const Color darkDivider = Color(0xFF2D2D2D);

  // Text Colors (Dark Theme)
  static const Color darkPrimaryText = Color(0xFFF8F9FA);
  static const Color darkSecondaryText = Color(0xFFADB5BD);
  static const Color darkDisabledText = Color(0xFF6C757D);

  // Common Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // Status Colors
  static const Color error = Color(0xFFFF6B6B);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color warningOrange = Color(0xFFFF9800);
}
