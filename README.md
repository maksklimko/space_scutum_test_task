Space Scutum Test Task
======================

Project Overview
----------------

This project follows clean architecture principles, using Flutter Bloc for state management. It is structured with a feature-based approach for scalability and maintainability.

Features
--------

*   **State Management:** Uses flutter_bloc
*   **Navigation:** Implements go_router
*   **Local Storage:** Uses hive_flutter
*   **Dependency Injection:** Utilizes get_it
*   **Networking:** Handles API requests with dio
*   **Serialization:** Converts JSON using json_serializable

### Installation

    flutter pub get

Generate necessary files:

    flutter packages pub run build_runner build --delete-conflicting-outputs

Run the application:

    flutter run

Dependencies
------------

### Main Dependencies

*   flutter_bloc - State management
*   go_router - Routing
*   hive_flutter, path_provider - Persistence
*   get_it - Dependency Injection
*   dio - Networking
*   json_annotation - JSON Serialization

### Dev Dependencies

*   build_runner, json_serializable, hive_generator - Code Generation
*   flutter_lints - Linting
*   flutter_test - Testing