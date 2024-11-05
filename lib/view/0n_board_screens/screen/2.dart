import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro/core/const_data/app_colors.dart';
import 'package:pro/core/const_data/app_imgs.dart';
import 'package:pro/view/0n_board_screens/control/p_control.dart';
import 'package:pro/widgets/helper/slider.dart';
import 'package:pro/widgets/helper/textbutton.dart';

class wid2 extends StatelessWidget {
  const wid2({super.key});

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
                // top: 66.0,
                // left: 0.0,
                top: mediaQuery.size.height * 0.14,
                left: mediaQuery.size.width * 0.01,

                child: Opacity(
                  opacity: 1,
                  child: Transform.rotate(
                    angle:
                        -0.037, // Rotation angle in radians (about 28.65 degrees)
                    child: Image.asset(
                      AppImage.thirdShape,
                    ),
                  ),
                ),
              ),
              Positioned(
                // top: 65.0,
                // left: 259.0,
                top: mediaQuery.size.height * 0.14,
                left: mediaQuery.size.width * 0.7,
                child: Opacity(
                    opacity: 1,
                    child: Image.asset(AppImage.fourthShape,
                        width: 45.0, height: 45.0)),
              ),
              Positioned(
                // top: 230.0,
                // left: 15.0,
                left: mediaQuery.size.width * 0.09,
                top: mediaQuery.size.height * 0.44,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //MainAxisAlignment:MainAxisAlignment.min,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Text(
                        'Let\'s Start Journey ',
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
                      height: 40,
                    ),
                    Opacity(
                      opacity: 0.4,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        'Smart, Gorgeous & Fashionable \n Collection Explore Now',
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
                // top: 399.0,
                // left: 120.0,
                // //   right: 10,
                left: mediaQuery.size.width * 0.33,
                top: mediaQuery.size.height * 0.70,

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
                // top: 530.0,
                // left: 2.0,
                top: mediaQuery.size.height * 0.9,
                left: mediaQuery.size.width * 0.01,

                child: CustomButton(
                  buttonText: "Next",
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
