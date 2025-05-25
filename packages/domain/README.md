# Domain Layer Style Guide

## Table of Contents

- [Overview](#overview)
- [Repositories](#repositories)
    - [Naming Conventions](#naming-conventions)
    - [Method Requirements](#method-requirements)
- [Use Cases](#use-cases)
    - [Naming Conventions](#naming-conventions-1)
    - [Method Requirements](#method-requirements-1)
- [Models](#models)
    - [Naming Conventions](#naming-conventions-2)
    - [Structure and Style](#structure-and-style)
- [Examples](#examples)

## Overview

The domain layer is responsible for encapsulating business logic. It should be free of any external dependencies, focusing purely on the business rules and logic.

For the convenience of writing models without unnecessary boilerplate code, I suggest using:

- freezed_annotation: x.x.x
- freezed: x.x.x

For working with collections:

- collection: x.x.x

And for supporting dependency injection:

- injectable: x.x.x
- injectable_generator: x.x.x

## Repositories

### Naming Conventions

- Repositories should be named with the entity they manage followed by the `Repository` suffix.
    - Example: `UserRepository`, `ProductRepository`

### Method Requirements

- Methods should be named clearly to describe the action they perform.
- Use verbs for method names to indicate actions, such as `get`, `create`, `update`, `delete`, `find`.
    - Example: `getUserById`, `createProduct`, `updateOrderStatus`, `deleteCustomer`, `findCustomer`

## Use Cases

### Naming Conventions

- Use cases should be named with the action they perform followed by the `UseCase` suffix.
    - Example: `FetchUserDetailsUseCase`, `UpdateProductPriceUseCase`

### Action Prefix Conventions

- **add_**: Used to denote actions that involve adding a new entity or data.
- **update_**: Used for actions that involve updating existing data or entities.
- **delete_**: Denotes actions that involve deleting an entity or data.
- **fetch_**: Used for actions that involve fetching or retrieving data.
- **load_**: Similar to fetch, but often used to indicate loading data into the application state.
- **set_**: Used for actions that involve setting or assigning a value.
- **get_**: Denotes actions that involve getting or accessing data, often used in selectors or getters.
- **remove_**: Similar to delete, used for removing data or entities, often from a list or collection.
- **create_**: Used for actions that involve creating new entities or data.
- **edit_**: Denotes actions that involve editing existing data or entities.
- **save_**: Used for actions that involve saving data, often to persistent storage.
- **submit_**: Denotes actions that involve submitting data, often used in form submissions.
- **validate_**: Used for actions that involve validating data or inputs.
- **init_**: Denotes actions that involve initializing or setting up initial state or data.
- **reset_**: Used for actions that involve resetting data or state to default values.
- **upload_**: Denotes actions that involve uploading data or files.
- **download_**: Used for actions that involve downloading data or files.
- **enable_**: Used for actions that involve enabling features or settings.
- **disable_**: Denotes actions that involve disabling features or settings.
- **assign_**: Used for actions that involve assigning data or tasks to users or entities.
- **complete_**: Denotes actions that involve completing tasks or processes.
- **cancel_**: Used for actions that involve canceling tasks or processes.
- **approve_**: Denotes actions that involve approving requests or tasks.
- **reject_**: Used for actions that involve rejecting requests or tasks.

### Method Requirements

- Each use case should have a single public method, typically called `execute`.
- Methods should accept necessary parameters and return a `Future` or a value.

```dart
abstract class UseCase<Type, Params> {
  Future<Type> execute(Params params);
}
```

## Models

### Naming Conventions

- Models should be named with singular nouns.
    - Example: `User`, `Order`, `Product`

### Structure and Style

- Models should be immutable and use `freezed` for immutability and union types.
- All fields should be final.
- Use proper data types for fields, and avoid using `dynamic`.

```dart
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
  }) = _User;
}
```

## Examples

### Repository Example

```dart
abstract class UserRepository {
  Future<User> getUserById(String id);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
  Future<void> deleteUser(String id);
}
```

### Use Case Example

```dart
class FetchUserDetailsUseCase implements UseCase<User, String> {
  final UserRepository repository;

  FetchUserDetailsUseCase(this.repository);

  @override
  Future<User> execute(String userId) {
    return repository.getUserById(userId);
  }
}
```

### Model Example

```dart
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
  }) = _User;
}
```
