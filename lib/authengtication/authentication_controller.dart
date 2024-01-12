import 'dart:io';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthenticationController extends GetxController
{
  static AuthenticationController instanceAuth = Get.find();

  late Rx<File?> _pickedFile;
  File? get profileImage => _pickedFile.value;

  void chooseImageWithCamera() async
  {
    final pickedImageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if(pickedImageFile != null)
      {
        Get.snackbar("Profile Image",
        "you have successfully selected your profile image."
        );
      }
    _pickedFile = Rx<File?>(File(pickedImageFile!.path));
  }
}