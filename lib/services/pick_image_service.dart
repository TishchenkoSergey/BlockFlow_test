import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

// ignore: one_member_abstracts
abstract class PickImageService {
  Future<Uint8List?> selectImage();
}

@Injectable(as: PickImageService)
class PickImageServiceImpl implements PickImageService {
  @override
  Future<Uint8List?> selectImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return pickedImage.readAsBytes();
    }

    return null;
  }
}
