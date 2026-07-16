import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF6366F1); // Indigo
  static const bgColor = Color(0xFFF8FAFC);
  static const surfaceColor = Colors.white;
  static const textColor = Color(0xFF1E293B);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: bgColor,
      colorSchemeSeed: primaryColor,
      fontFamily: 'Inter', // Make sure to add this font or use default
      cardTheme: CardThemeData(
        color: surfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  static Color getPriorityColor(String priority) {
    if (priority.contains('High')) return const Color(0xFFEF4444);
    if (priority.contains('Medium')) return const Color(0xFFF59E0B);
    return const Color(0xFF10B981);
  }
}