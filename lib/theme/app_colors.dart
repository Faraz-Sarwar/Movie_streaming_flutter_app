import 'package:flutter/material.dart';

class AppColors {
  // 🔴 Primary (CTA buttons, highlights)
  static const Color primary = Color(0xFFE50914); // Netflix-style red
  static const Color primaryDark = Color(0xFFB20710);
  static const Color primaryLight = Color(0xFFFF4C4C);

  // ⚫ Backgrounds
  static const Color background = Color(0xFF0F0F0F); // main screen
  static const Color surface = Color(0xFF1A1A1A); // cards / containers
  static const Color elevated = Color(0xFF242424);

  // ⚪ Text colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color primaryText = Color(0xFFEAEAEA);
  static const Color secondaryText = Color(0xFFB3B3B3);
  static const Color mutedText = Color(0xFF808080);

  // 🩶 UI Elements
  static const Color border = Color(0xFF2A2A2A);
  static const Color divider = Color(0xFF333333);

  // ⭐ Accent (ratings / highlights like yellow stars)
  static const Color rating = Color(0xFFFFC107);

  // 🔘 Icon states
  static const Color iconActive = primary;
  static const Color iconInactive = Color(0xFF777777);
}
