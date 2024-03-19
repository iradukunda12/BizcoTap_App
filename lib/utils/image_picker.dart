import 'package:bizcotap/utils/app_exports.dart';

class MyImagePicker {
  String? editedImagePath;

  Future<void> selectProfileImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      editedImagePath = pickedFile.path;
    }
  }
}
