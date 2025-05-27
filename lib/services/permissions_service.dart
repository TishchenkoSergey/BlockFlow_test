import 'package:flutter/cupertino.dart';

import 'package:permission_handler/permission_handler.dart';

enum MediaPermissionStatus {
  granted,
  denied,
  permanentlyDenied;

  bool get isGranted => this == MediaPermissionStatus.granted;

  bool get isDenied => this == MediaPermissionStatus.denied;

  bool get isPermanentlyDenied => this == MediaPermissionStatus.permanentlyDenied;
}

class PermissionsService extends ChangeNotifier {
  final _permissions = [Permission.camera, Permission.microphone];

  MediaPermissionStatus _mediaPermissionsStatus = MediaPermissionStatus.denied;

  MediaPermissionStatus get mediaPermissionsStatus => _mediaPermissionsStatus;

  Future<void> requestPermissions() async {
    final permissionsStatuses = [for (final p in _permissions) await p.request()];
    _mediaPermissionsStatus =
        permissionsStatuses.every((it) => it.isGranted)
            ? MediaPermissionStatus.granted
            : permissionsStatuses.any((it) => it.isPermanentlyDenied)
            ? MediaPermissionStatus.permanentlyDenied
            : MediaPermissionStatus.denied;
    notifyListeners();
  }

  Future<void> openSettings() async {
    await openAppSettings();
  }
}
