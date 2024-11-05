import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro/core/const_data/app_colors.dart';
import 'package:pro/core/service/routes.dart';
import 'package:pro/view/register/control/register_control.dart';
import 'package:pro/widgets/helper/banner.dart';
import 'package:pro/widgets/helper/form.dart';
import 'package:pro/widgets/helper/googlebtn.dart';
import 'package:pro/widgets/helper/textbutton.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return GetBuilder(
      init: RegisterController(),
      builder: (registerController) => Scaffold(
        backgroundColor: ColorManger.white,
        body: SingleChildScrollView(
          child: Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuery.size.height * 0.19,
                  width: mediaQuery.size.width * 0.19,
                ),
                const banner(firstLine: 'Register Account'),
                SizedBox(
                  height: mediaQuery.size.height * 0.03,
                  width: mediaQuery.size.width * 0.039,
                ),
                Form(
                  key: registerController.signupFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        controller: registerController.usernameController,
                        labelText: 'Your Name',
                        hintText: 'xxxxxxxx',
                        obscure: false,
                        valid: registerController.usernameValidator,
                        focusNode: registerController.usernameFocusNode,
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.019,
                        width: mediaQuery.size.width * 0.019,
                      ),
                      CustomTextField(
                        controller: registerController.emailController,
                        focusNode: registerController.emailFocusNode,
                        valid: registerController.emailValidator,
                        labelText: 'Email Address',
                        hintText: 'xyz@gmail.com',
                        obscure: false,
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.019,
                        width: mediaQuery.size.width * 0.019,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'password',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextFormField(
                            controller: registerController.passwordController,
                            focusNode: registerController.passwordFocusNode,
                            validator: registerController.passwordValidator,
                            obscureText: registerController.isObscure,
                            decoration: InputDecoration(
                              hintText: 'xxxxxxxx',
                              border: InputBorder.none,
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(registerController.isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: registerController.toggleObscure,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaQuery.size.height * 0.019,
                  width: mediaQuery.size.width * 0.019,
                ),
                CustomButton(
                  buttonText:
                      registerController.isLoading ? 'Loading...' : 'Sign Up',
                  onPressed:
                      //    () {
                      registerController.signup,
                  // if (registerController.nameController.text.isEmpty) {
                  //   Get.snackbar('Error', "UserName field is required");
                  // } else if (registerController
                  //     .emailController.text.isEmpty) {
                  //   Get.snackbar('Error', "Email field is required");
                  // } else if (registerController
                  //     .passwordController.text.isEmpty) {
                  //   Get.snackbar('Error', "Password field is required");
                  // } else {
                  //   registerController.signup;
                  // }
                  //  },
                  bckColor: ColorManger.sign_logInBtn,
                  textColor: ColorManger.white,
                ),
                const SizedBox(
                  //width: double.infinity,
                  child: googleBtn('Sign Up With Google'),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed(Routes.Login);
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have An Account?',
                        style: TextStyle(color: ColorManger.grey),
                      ),
                      SizedBox(width: 3),
                      Text(
                        'Log In',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
