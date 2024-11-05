import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro/core/service/routes.dart';
import '/view/profile/profileimage.dart';

class ProfileScreen extends StatelessWidget {
  final ImageController imageController = Get.put(ImageController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = imageController.name.value;
    emailController.text = imageController.email.value;
    passwordController.text = imageController.password.value;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAllNamed(Routes.homescreen);
            },
          ),
          // InkWell(
          //   onTap: () {
          //     Get.back();
          //   },
          //   child: Icon(Icons.arrow_back),
          // ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => imageController.pickImage(),
                child: Obx(
                  () => CircleAvatar(
                    radius: 50,
                    backgroundImage: imageController.selectedImage.value != null
                        ? FileImage(imageController.selectedImage.value!)
                        : NetworkImage('https://example.com/default_image.jpg')
                            as ImageProvider,
                    child: imageController.selectedImage.value == null
                        ? Icon(Icons.add_a_photo, size: 30, color: Colors.white)
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: nameController,
                labelText: 'Your Name',
                hintText: 'Programmer X',
                onChanged: (value) => imageController.updateName(value),
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: emailController,
                labelText: 'Email Address',
                hintText: 'programmerx@gmail.com',
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => imageController.updateEmail(value),
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: passwordController,
                labelText: 'Password',
                hintText: '********',
                obscureText: true,
                onChanged: (value) => imageController.updatePassword(value),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  imageController.saveData();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Save Now',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required Function(String) onChanged,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      onChanged: onChanged,
    );
  }
}
