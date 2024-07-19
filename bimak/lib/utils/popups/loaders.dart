import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/colors.dart';
import '../helpers/helpers_utils.dart';

//loader for alerts
class MLoaders {
  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: MHelperFunctions.isDarkMode(Get.context!)
                ? MColors.grey.withOpacity(0.9)
                : const Color.fromARGB(255, 138, 135, 135).withOpacity(0.9),
          ),
          child: Center(
              child: Text(message,
                  style: Theme.of(Get.context!).textTheme.labelLarge)),
        ),
      ),
    );
  }

  ///Success Alert
  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MColors.light,
      backgroundColor: MColors.primaryColor,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: MColors.light),
    );
  }

  ///Warning Alert
  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MColors.light,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: MColors.light),
    );
  }

  ///Error Alert
  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: MColors.light,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: MColors.light),
    );
  }
}