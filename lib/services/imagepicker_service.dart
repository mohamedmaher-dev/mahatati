// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.rear,
      imageQuality: 25,
    );
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }
}
