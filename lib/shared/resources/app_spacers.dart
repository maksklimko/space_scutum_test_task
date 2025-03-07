import 'package:flutter/material.dart';

/// Utility class for application-wide spacing values
/// Private constructor prevents instantiation
class AppSpacers {
  AppSpacers._();

  //Horizontal spacers
  static const Widget h10px = SizedBox(width: 10);

  //Vertical spacers
  static const Widget v10px = SizedBox(height: 10);
}
