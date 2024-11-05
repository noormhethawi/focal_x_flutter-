import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro/core/const_data/app_colors.dart';
import 'package:pro/core/const_data/app_imgs.dart';
import 'package:pro/view/0n_board_screens/control/p_control.dart';
import 'package:pro/view/register/screen/register_screen.dart';
import 'package:pro/widgets/helper/slider.dart';
import 'package:pro/widgets/helper/textbutton.dart';

class wid3 extends StatelessWidget {
  const wid3({super.key});

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

                // top: 66.0,
                // left: 30.0,
                child: Opacity(
                    opacity: 1,
                    child: Image.asset(AppImage.fourthShape,
                        scale: mediaQuery.size.width * 0.001,
                        width: 77.0,
                        height: 77.0)),
              ),
              Positioned(
                left: mediaQuery.size.width * 0.07,
                top: mediaQuery.size.height * 0.39,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //MainAxisAlignment:MainAxisAlignment.min,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Text(
                        'You Have the \n Power To',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEBEBEB),
                          fontSize: 34,
                          fontFamily: 'Raleway',
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        'There Are Many Beautiful And Attractive \n Plants To Your Room',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          //    fontWeight: FontWeight.bold,
                          color: ColorManger.white, height: 0,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                // top: 530.0,
                // left: 2.0,
                left: mediaQuery.size.width * 0.33,
                top: mediaQuery.size.height * 0.70,

                // top: 410.0,
                // left: 120.0,
                //   right: 10,
                child: SliderDots(
                  totalDots: homeController.pages.length,
                  currentIndex: homeController.currentIndex.value,
                ),
              ),
              Positioned(
                // width: 315,
                // top: 530.0,
                // left: 2.0,
                width: mediaQuery.size.width * 0.88,

                top: mediaQuery.size.height * 0.9,
                left: mediaQuery.size.width * 0.01,

                child: CustomButton(
                  buttonText: "Next",
                  onPressed: () {
                    Get.to(RegisterScreen());
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
