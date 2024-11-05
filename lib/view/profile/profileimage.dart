import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';
//import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var selectedImage = Rx<File?>(null);
  var name = Rx<String>('Programmer X');
  var email = Rx<String>('');
  var password = Rx<String>('');

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    name.value = box.read('name') ?? 'Programmer X';
    email.value = box.read('email') ?? '';
    password.value = box.read('password') ?? '';
  }

  Future<void> pickImage() async {
    // اختيار صورة
    // final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    // if (pickedFile != null) {
    //   selectedImage.value = File(pickedFile.path);
    // }
  }

  void updateName(String newName) {
    name.value = newName;
  }

  void updateEmail(String newEmail) {
    email.value = newEmail;
  }

  void updatePassword(String newPassword) {
    password.value = newPassword;
  }

  void saveData() {
    // حفظ البيانات
    box.write('name', name.value);
    box.write('email', email.value);
    box.write('password', password.value);
  }
}
