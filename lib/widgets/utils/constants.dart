import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'VeloTask';
  
  // Layout values
  static const double desktopPadding = 32.0;
  static const double tabletPadding = 24.0;
  static const double mobilePadding = 16.0;
  
  // Grid settings
  static int getGridCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 1200) return 4;
    if (width > 900) return 3;
    if (width > 600) return 2;
    return 1;
  }
}