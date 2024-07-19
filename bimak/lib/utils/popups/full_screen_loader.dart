import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helpers_utils.dart';

//A Utility class for managing a full_screen Loader
class MFullScreenloader {
  ///Open a full screen Loading
  ///This method does not return anything
  ///
  ///parameters:
  ///- text: The text to be displayed
  ///- animation: The animation to be shown
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
              canPop: false,
              child: Container(
                color: MHelperFunctions.isDarkMode(Get.context!)
                    ? MColors.dark
                    : MColors.light,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 200),
                    MAnimationLoaderWidget(text: text, animation: animation),
                  ],
                ),
              ),
            ));
  }

  //Stop current loading
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
