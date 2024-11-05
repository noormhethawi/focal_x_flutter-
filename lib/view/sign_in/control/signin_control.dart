import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pro/core/const_data/const_data.dart';
import 'package:pro/core/service/my_service.dart';
import 'package:pro/core/service/routes.dart';
import 'package:pro/model/user/logged_user.dart';
import 'package:pro/model/user/user_model.dart';

class SigninControl extends GetxController {
//fcm = await MyService.fetchFCMTokens;
  static SigninControl get to => Get.find<SigninControl>();

  final GlobalKey<FormState> signinFormKey =
      GlobalKey<FormState>(debugLabel: 'signinFormKey');
  //final signupFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final formEmailFieldKey = GlobalKey<FormFieldState>();
  final passwordController = TextEditingController();
  final formPasswordFieldKey = GlobalKey<FormFieldState>();
  final RxString passwordError = ''.obs;

  FocusNode usernameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  final RxBool hasPasswordError = false.obs;
  bool isLoading = false;
  bool _isObscure = true;
  final storage = GetStorage();

  SigninControl() {
    Get.put<SigninControl>(this);
  }
  @override
  void onInit() {
    _addListener();
    MyService().fetchFCMTokens();
    // textFieldFocusNode.hasFocus = false;
    super.onInit();
  }

  bool get isObscure => _isObscure;

  void toggleObscure() {
    _isObscure = !_isObscure;

    // _isObscure.toggle();
    update();
  }

  void _addListener() {
    emailFocusNode.addListener(() {
      if (!emailFocusNode.hasFocus) {
        emailValidator(
          emailController.text,
        );
        //  formEmailFieldKey.currentState!.validate();
      }
    });
    passwordFocusNode.addListener(
      () {
        if (!passwordFocusNode.hasFocus) {
          passwordValidator(
            passwordController.text,
          );
          //formPasswordFieldKey.currentState!.validate();
        }
      },
    );
  }

  // Text editing controllers
  //final nameController = TextEditingController();
  //final emailController = TextEditingController();
  // final passwordController = TextEditingController();

  String? usernameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (value.trim().length < 4) {
      return 'Username must be at least 4 characters in length';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email address';
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (value.trim().length < 8) {
      return 'Password must be at least 8 characters in length';
    }
    return null;
  }
Future<void>fetchAccessToken() async {
  
}

  Future<void> signin() async {
    isLoading = true;
    update();
    MyService().fetchFCMTokens();
    // return ConstData.FCM;
    // Get.to(home);
    // Validate form
    //emailValidator//passwordValidator//usernameValidator
    if (signinFormKey.currentState!.validate()) {
      // Save form data
      signinFormKey.currentState!.save();

      // Create a User object with the form data
      loggeduser User = loggeduser(
        email: emailController.text,
        password: passwordController.text,
      );
      try {
        final response = await http.post(
          Uri.parse('https://task.focal-x.com/api/login'),
          headers: {'Accept': 'application/json'},
          body: {
            'email': User.email,
            'password': User.password,
            'fcm_token': ConstData.FCM,
          },
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          ConstData.access_token = data['data']['access_token'];
          // Handle successful registration
          print('Registration successful: ${data['message']}');
          Get.offAllNamed(Routes.homescreen);
          storage.write('islogin', true);
          //  print('Access T: ${data['data']['access_token']}');
        } else {
          // Handle error
          print('Failed to register');
          //  print(response.statusCode);
          //print(response.body);
        }
      } catch (e) {
        print('Error during registration: $e');
      }
      //try {} catch (e) {}
      // Perform signup logic here
      // Example: Send user data to an API, register the user, etc.
      // print(usernameController.text);
      // print(User.email);
      // print(User.password);
      // Clear form data after signup

      //emailController.clear();
      //passwordController.clear();
    }
    isLoading = false;
  }

  Future<void> Logout() async {
    try {
      final response = await http.post(
        Uri.parse('https://task.focal-x.com/api/logout'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${ConstData.access_token}',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // ConstData.access_token = data['data']['access_token'];
        print(' successful: ${data['message']}');
        Get.offAllNamed(Routes.Login);
        storage.write('islogin', false);
        ConstData.access_token = null;

        //  print('Access T: ${data['data']['access_token']}');
      } else {
        // Handle error
        print('Failed to Logout');
        print(response.statusCode);
        print(response.body);
        print(ConstData.access_token);
      }
    } catch (e) {
      print('Error during logout: $e');
    }
  }
  // @override
  // void onClose() {
  //   usernameController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  //   // usernameController.dispose();
  //   usernameFocusNode.dispose();
  //   emailController.dispose();
  //   emailFocusNode.dispose();
  //   passwordController.dispose();
  //   passwordFocusNode.dispose();
  // }
}
