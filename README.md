# BlockFlow test

> A modern Flutter app to capture photos/videos with overlay functionality using Android's scoped storage and photo picker (Android 11+).

---

## Features

- **Camera permission prompt** on startup
- **Switch between front and back cameras**
- **Add image overlay** from gallery (80% transparent)
- **Take a photo** and save to gallery
- **Record video** and save using **MediaStore**
- Compatible with **Android 11+ scoped storage**
- No storage permission required for image picking

---

## UI Overview

| Function            | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| Switch Camera       | Toggles between front and back cameras                                      |
| Add Overlay Image   | Uses Android’s [Photo Picker](https://developer.android.com/training/data-storage/shared/photopicker) |
| Record Video        | Starts and stops video recording                                            |
| Take Photo          | Captures a photo and saves it using [MediaStore](https://developer.android.com/training/data-storage/shared/media) |

---

## Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/TishchenkoSergey/BlockFlow_test.git
cd blockflow_test
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Install Dependencies
```bash
flutter run
```

## Presenter Layer

The Presenter Layer is responsible for presenting data to the user. It includes the presentation logic and state
management. For detailed guidelines on how to structure the presenter layer, refer to
the [Presenter Layer Guide](doc/style/presenter.md).