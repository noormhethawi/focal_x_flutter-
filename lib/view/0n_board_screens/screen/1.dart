import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro/core/const_data/app_colors.dart';
import 'package:pro/core/const_data/app_imgs.dart';
import 'package:pro/view/0n_board_screens/control/p_control.dart';
import 'package:pro/widgets/helper/slider.dart';
import 'package:pro/widgets/helper/textbutton.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: ColorManger.onBoardBackGround,
      body: SingleChildScrollView(
        child: Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: mediaQuery.size.height * 0.14,
                left: mediaQuery.size.width * 0.1,

                // top: 76.0,
                // left: 59.0,
                child:
                    Image.asset(AppImage.secShape, width: 27.0, height: 30.0),
              ),
              Positioned(
                top: mediaQuery.size.height * 0.2,
                left: mediaQuery.size.width * 0.7,

                // top: 125.0,
                // left: 259.0,
                child: Opacity(
                    opacity: 0.4,
                    child: Image.asset(AppImage.fourthShape,
                        width: 45.0, height: 45.0)),
              ),
              Positioned(
                top: mediaQuery.size.height * 0.4,
                left: mediaQuery.size.width * 0.17,

//                top: 230.0,
                //              left: 50.0,
                child: Column(
                  children: [
                    const SizedBox(
                      child: Text(
                        'WELCOME TO\n BYTE BOUTIQUE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEBEBEB),
                          fontSize: 30,
                          fontFamily: 'Raleway',
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Opacity(
                      opacity: 1,
                      child: Image.asset(AppImage.fivthShape,
                          width: 134.0, height: 18.0),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: mediaQuery.size.height * 0.66,
                left: mediaQuery.size.width * 0.57,

                // top: 386.0,
                // left: 238.31,

                child: Opacity(
                  opacity: 0.4,
                  child: Transform.rotate(
                    angle:
                        -0.037, // Rotation angle in radians (about 28.65 degrees)
                    child: Image.asset(
                      AppImage.thirdShape,
                    ),
                  ),
                ),
                //Image.asset(AppImage.thirdShape, width: 90.0, height: 54.0),
              ),
              Positioned(
                //  top: 427.01,
                //  left: 29.0,
                top: mediaQuery.size.height * 0.74,
                left: mediaQuery.size.width * 0.08,

                child: Opacity(
                  opacity: 0.4,
                  child: Transform.rotate(
                    angle:
                        -0.053, // Rotation angle in radians (about 28.65 degrees)
                    child: Image.asset(AppImage.firstShape, height: 94.0),
                  ),
                ),
              ),
              Positioned(
                top: mediaQuery.size.height * 0.7,
                left: mediaQuery.size.width * 0.33,

                // top: 399.0,
                // left: 120.0,
                //   right: 10,
                child: SliderDots(
                  totalDots: homeController.pages.length,
                  currentIndex: homeController.currentIndex.value,
                ),
              ),
              Positioned(
                width: mediaQuery.size.width * 0.88,
                // top: 530.0,
                // left: 2.0,
                top: mediaQuery.size.height * 0.9,
                left: mediaQuery.size.width * 0.01,

                child: CustomButton(
                  buttonText: "Get Started",
                  onPressed: () {
                    homeController.goToNextPage();
                  },
                  bckColor: ColorManger.white,
                  textColor: ColorManger.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
