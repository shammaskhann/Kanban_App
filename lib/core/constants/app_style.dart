import 'package:flutter/material.dart';
import 'package:kanban_app/core/constants/app_color.dart';

class AppStyles {
  // Border Radius
  static const double borderRadiusXS = 4.0;
  static const double borderRadiusS = 8.0;
  static const double borderRadiusM = 12.0;
  static const double borderRadiusL = 16.0;
  static const double borderRadiusXL = 24.0;
  static const double borderRadiusXXL = 32.0;

  static const BorderRadius borderRadiusCard = BorderRadius.all(
    Radius.circular(borderRadiusM),
  );
  static const BorderRadius borderRadiusColumn = BorderRadius.all(
    Radius.circular(borderRadiusL),
  );
  static const BorderRadius borderRadiusButton = BorderRadius.all(
    Radius.circular(borderRadiusM),
  );
  static const BorderRadius borderRadiusTag = BorderRadius.all(
    Radius.circular(borderRadiusXS),
  );

  // Shadows
  static const List<BoxShadow> shadowXS = [
    BoxShadow(color: Color(0x0A000000), blurRadius: 2, offset: Offset(0, 1)),
  ];

  static const List<BoxShadow> shadowS = [
    BoxShadow(color: Color(0x14000000), blurRadius: 4, offset: Offset(0, 2)),
  ];

  static const List<BoxShadow> shadowM = [
    BoxShadow(color: Color(0x1F000000), blurRadius: 8, offset: Offset(0, 4)),
  ];

  static const List<BoxShadow> shadowL = [
    BoxShadow(color: Color(0x29000000), blurRadius: 16, offset: Offset(0, 8)),
  ];

  static const List<BoxShadow> shadowXL = [
    BoxShadow(color: Color(0x3D000000), blurRadius: 24, offset: Offset(0, 12)),
  ];

  // Dark mode shadows
  static const List<BoxShadow> shadowDarkS = [
    BoxShadow(color: Color(0x33000000), blurRadius: 4, offset: Offset(0, 2)),
  ];

  static const List<BoxShadow> shadowDarkM = [
    BoxShadow(color: Color(0x4D000000), blurRadius: 8, offset: Offset(0, 4)),
  ];

  // Borders
  static const BorderSide borderLight = BorderSide(
    color: AppColors.lightBorder,
    width: 1.0,
  );

  static const BorderSide borderDark = BorderSide(
    color: AppColors.darkBorder,
    width: 1.0,
  );

  static const BorderSide borderFocusLight = BorderSide(
    color: AppColors.primary,
    width: 2.0,
  );

  static const BorderSide borderFocusDark = BorderSide(
    color: AppColors.primaryLight,
    width: 2.0,
  );

  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;
}
