import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Helper {
  static File? parentImageFile;
  static Future<File> getImage({required ImageSource imageSource}) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      parentImageFile = File(image.path);
    }
    return parentImageFile!;
  }
}
