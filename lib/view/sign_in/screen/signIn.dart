import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pro/core/const_data/app_colors.dart';
import 'package:pro/core/service/routes.dart';
import 'package:pro/view/sign_in/control/signin_control.dart';
import 'package:pro/widgets/helper/banner.dart';
import 'package:pro/widgets/helper/form.dart';
import 'package:pro/widgets/helper/googlebtn.dart';
import 'package:pro/widgets/helper/textbutton.dart';

class signInScreen extends StatelessWidget {
  const signInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return GetBuilder(
      init: SigninControl(),
      builder: (signinControl) => Scaffold(
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
              const banner(firstLine: 'Hello Again!'),
              SizedBox(
                height: mediaQuery.size.height * 0.03,
                width: mediaQuery.size.width * 0.039,
              ),
              Form(
                key: signinControl.signinFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      controller: signinControl.emailController,
                      focusNode: signinControl.emailFocusNode,
                      valid: signinControl.emailValidator,
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
                          controller: signinControl.passwordController,
                          focusNode: signinControl.passwordFocusNode,
                          validator: signinControl.passwordValidator,
                          obscureText: signinControl.isObscure,
                          decoration: InputDecoration(
                            hintText: 'xxxxxxxx',
                            border: InputBorder.none,
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(signinControl.isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: signinControl.toggleObscure,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.06,
                width: mediaQuery.size.width * 0.19,
              ),
              CustomButton(
                buttonText: signinControl.isLoading ? 'Loading...' : 'Sign In',
                onPressed:
                    //    () {
                    signinControl.signin,
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
              SizedBox(
                height: mediaQuery.size.height * 0.01,
                width: mediaQuery.size.width * 0.19,
              ),
              const SizedBox(
                width: double.infinity,
                child: googleBtn('Sign In With Google'),
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.15,
                width: mediaQuery.size.width * 0.19,
              ),
              GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.register);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New User?',
                      style: TextStyle(color: ColorManger.grey),
                    ),
                    SizedBox(width: 3),
                    Text(
                      'Create Account',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
