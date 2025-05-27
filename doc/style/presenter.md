# Presenter Layer Style Guide

## Table of Contents

- [Overview](#overview)
- [Creating a Feature](#creating-a-feature)
  - [Structure of Feature](#structure-of-a-feature)
  - [Common Components](#common-components)
- [BLoCs](#blocs)
  - [Naming Conventions](#naming-conventions)
  - [Structure and Style](#structure-and-style)
- [Widgets](#widgets)
  - [Naming Conventions](#naming-conventions-1)
  - [Structure and Style](#structure-and-style-1)
- [Routing](#routing)
- [Themes](#themes)
- [Localizations](#localizations)
- [Common Constants](#common-constants)
- [Local Constants](#local-constants)
- [Examples](#examples)

## Overview

The presenter layer is responsible for the presentation logic of the application. This includes managing the state, handling user inputs, and displaying the UI. It interacts with the domain layer to fetch and manipulate data.

Sure! Here are some improvements for the markdown file to enhance readability, clarity, and completeness:

Your updated structure with the added required export files looks good. Here is a slightly refined version for better clarity and consistency:

## Creating a Feature

### Structure of a Feature

Each feature should have a well-defined structure to separate concerns and maintain modularity. The typical structure of a feature includes the following components:

```
lib/
  features/
    feature_group_name/
      features.dart       // Exports all features in this group
      features.md         // Describes the feature group and relations between features
      models/             // Common models for sub-features
        models.dart       // Exports model files
      widgets/            // Common widgets for sub-features
        widgets.dart      // Exports widget files
      features/
        feature_name1/
          bloc/
            bloc.dart     // Exports BLoC files
          models/
            models.dart   // Exports model files
          views/
            views.dart    // Exports view files
          widgets/
            widgets.dart  // Exports widget files
          feature.dart    // Exports BLoC and view for this feature
          feature.md      // Describes this feature and its relations with other features
        feature_name2/
          bloc/
            bloc.dart     // Exports BLoC files
          models/
            models.dart   // Exports model files
          views/
            views.dart    // Exports view files
          widgets/
            widgets.dart  // Exports widget files
          feature.dart    // Exports BLoC and view for this feature
          feature.md      // Describes this feature and its relations with other features
      widgets/            // Common widgets for the feature group
        widgets.dart      // Exports common widget files
```

### Explanation of Structure

- **lib/features/feature_group_name**: This directory contains all the features related to a specific group.
  - **features.dart**: A single export file for all features within the group to facilitate easier imports.
  - **features.md**: A markdown file that documents the feature group and describes the relationships between different features.
  - **models/**: Directory for models that are common across multiple sub-features within the feature group.
    - **models.dart**: An export file for all model files within this directory.
  - **widgets/**: Directory for widgets that are commonly used across multiple sub-features within the feature group.
    - **widgets.dart**: An export file for all widget files within this directory.

- **lib/features/feature_group_name/features/**: Directory containing individual sub-features.
  - **feature_name/**: Directory for each specific feature.
    - **bloc/**: Contains the BLoC (Business Logic Component) files for managing the feature's state and logic.
      - **bloc.dart**: An export file for all BLoC files within this directory.
    - **models/**: Directory for models specific to this feature.
      - **models.dart**: An export file for all model files within this directory.
    - **views/**: Contains the UI components for this feature.
      - **views.dart**: An export file for all view files within this directory.
    - **widgets/**: Contains widgets specific to this feature.
      - **widgets.dart**: An export file for all widget files within this directory.
    - **feature.dart**: A single export file for the BLoC and view components of this feature.
    - **feature.md**: A markdown file that describes this feature in detail, including its purpose and how it interacts with other features.

- **lib/features/feature_group_name/widgets/**: Directory for common widgets used across the entire feature group.
  - **widgets.dart**: An export file for all common widget files within this directory.


### Common Components

- **BLoCs**: Manage state and business logic.
- **Models**: Represent the data used in the feature.
- **Views**: Define the UI layout and components.
- **Widgets**: Reusable UI components specific to the feature.

## BLoCs

### Naming Conventions

- BLoCs should be named with the entity they manage followed by the `Bloc` suffix.
  - Example: `UserBloc`, `ProductBloc`

### Structure and Style

- Each BLoC should extend the `Bloc` class and define the events and states it manages.
- Use `equatable` to make states and events comparable.

```dart
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    // Handle events and update state
  }
}
```

## Widgets

### Naming Conventions

- Widgets should be named with the entity they represent.
  - Example: `UserCard`, `ProductList`

### Structure and Style

- Use `StatelessWidget` and `StatefulWidget` appropriately.
- Break down complex widgets into smaller, reusable components.

```dart
class UserCard extends StatelessWidget {
  final User user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
      ),
    );
  }
}
```

## Routing

- Define routes in a central place using a router package like `go_router`.
- Use meaningful names for routes.

```dart
final GoRouter _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => HomePage(),
    ),
    GoRoute(
      path: '/details',
      builder: (BuildContext context, GoRouterState state) => DetailsPage(),
    ),
  ],
);
```

## Themes

- Define themes in a central place.
- Use `ThemeData` to customize the look and feel of the app.

```dart
final ThemeData appTheme = ThemeData(
  primaryColor: Colors.blue,
  accentColor: Colors.orange,
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 16),
  ),
);
```

## Localizations

- Use ARB files for managing localizable strings.
- Follow the official Flutter localization guide.

```dart
{
  "@@locale": "en",
  "title": "Hello World",
  "@title": {
    "description": "The title of the application"
  }
}
```

## Common Constants

- Define common constants in a central place.
- Use meaningful names for constants.

```dart
class AppConstants {
  static const String appName = 'MyApp';
  static const double defaultPadding = 16.0;
}
```

## Local Constants

- Define local constants within the feature or widget where they are used.
- Use meaningful names for constants.

```dart
const double _localPadding = 8.0;
```

## Examples

### BLoC Example

```dart
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUser) {
      yield UserLoading();
      try {
        final user = await userRepository.getUserById(event.userId);
        yield UserLoaded(user: user);
      } catch (_) {
        yield UserError();
      }
    }
  }
}
```

### Widget Example

```dart
class UserCard extends StatelessWidget {
  final User user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
      ),
    );
  }
}
```

### Routing Example

```dart
final GoRouter _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => HomePage(),
    ),
    GoRoute(
      path: '/details',
      builder: (BuildContext context, GoRouterState state) => DetailsPage(),
    ),
  ],
);
```

### Theme Example

```dart
final ThemeData appTheme = ThemeData(
  primaryColor: Colors.blue,
  accentColor: Colors.orange,
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 16),
  ),
);
```