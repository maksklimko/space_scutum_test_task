import 'package:flutter/material.dart';
import 'package:space_scutum_test_task/app.dart';
import 'package:space_scutum_test_task/shared/utils/injector.dart';

/// Entry point of the application.
/// Initializes necessary services and starts the app.
void main() async {
  // Set up dependency injection using GetIt service locator
  setupInjector();

  // Launch the root widget of the application
  runApp(const App());
}
