import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current index when page scrolls
  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  /// Jump to the specific dot selected page
  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Update current index and jump to the next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();

      storage.write('isFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update current index and skip to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
