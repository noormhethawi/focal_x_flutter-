import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/view/homescreen/homescreencontroller.dart';
import '/view/my_cart/cart_controller.dart';
import '/view/my_cart/cart_screen.dart';
import '/view/favorite/favorite_controller.dart';
import '/widgets/custombuttonappbar/appbarbutton.dart';

class Homescree extends StatelessWidget {
  const Homescree({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    Get.put(FavoriteController());
    Get.put(HomescreencontrollerImp());

    return GetBuilder<HomescreencontrollerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            backgroundColor: Colors.green,
            onPressed: () {
              Get.to(() => CartScreen());
            },
            child: Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            elevation: 10,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AppbarbuttonHome(),
        body: Container(
          color: const Color.fromARGB(255, 247, 246, 246),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: controller.listpage.elementAt(controller.currentpage),
          ),
        ),
      ),
    );
  }
}
