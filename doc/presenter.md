# Presenter Layer Style Guide

## Table of Contents

- [Overview](#overview)
- [BLoCs](#blocs)
  - [Naming Conventions](#naming-conventions)
  - [Structure and Style](#structure-and-style)
- [Widgets](#widgets)
  - [Naming Conventions](#naming-conventions-1)
  - [Structure and Style](#structure-and-style-1)
- [Routing](#routing)

## Overview

The presenter layer is responsible for the presentation logic of the application. This includes managing the state, handling user inputs, and displaying the UI. It interacts with the domain layer to fetch and manipulate data.

Sure! Here are some improvements for the markdown file to enhance readability, clarity, and completeness:

Your updated structure with the added required export files looks good. Here is a slightly refined version for better clarity and consistency:

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
