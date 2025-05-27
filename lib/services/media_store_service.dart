import 'dart:io';

import 'package:flutter/services.dart';

import 'package:injectable/injectable.dart';

abstract class MediaStoreService {
  Future<void> saveImage(File file);

  Future<void> saveVideo(File file);
}

@Injectable(as: MediaStoreService)
class MediaStoreServiceImpl implements MediaStoreService {
  static const _channel = MethodChannel('media_store_channel');

  @override
  Future<void> saveImage(File file) async {
    if (Platform.isAndroid) {
      await _channel.invokeMethod('saveImage', {'path': file.path});
    }
  }

  @override
  Future<void> saveVideo(File file) async {
    if (Platform.isAndroid) {
      await _channel.invokeMethod('saveVideo', {'path': file.path});
    }
  }
}
