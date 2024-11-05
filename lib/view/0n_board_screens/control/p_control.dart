import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro/view/0n_board_screens/screen/1.dart';
import 'package:pro/view/0n_board_screens/screen/2.dart';
import 'package:pro/view/0n_board_screens/screen/3.dart';
import 'package:pro/view/register/screen/register_screen.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var pages = <Widget>[
    const MyWidget(),
    const wid2(),
    const wid3(),
  ].obs;

  void goToPage(int index) {
    if (index >= 0 && index < pages.length) {
      currentIndex.value = index;
    }
  }

  void goToNextPage() {
    int nextIndex = currentIndex.value + 1;
    if (nextIndex < pages.length) {
      currentIndex.value = nextIndex;
      Get.to(pages[currentIndex.value]);
    }
  }

  void goToPreviousPage() {
    int previousIndex = currentIndex.value - 1;
    if (previousIndex >= 0) {
      currentIndex.value = previousIndex;
      Get.to(pages[currentIndex.value]);
    }
  }
}
