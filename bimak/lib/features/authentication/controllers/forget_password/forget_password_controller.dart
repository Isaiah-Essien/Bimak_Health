
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/auth_repository.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/device/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../screens/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  ///variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///Send reset Email
  sendPasswordResetEmail() async {
    try {
      //Start Loading
      MFullScreenloader.openLoadingDialog(
          'Processing your request...', MImages.docerAnimation);

      //Check Internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenloader.stopLoading();
        return;
      }

      //Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        MFullScreenloader.stopLoading();
        return;
      }

      await AuthRepository.instance.sendPasswordResetEmail(email.text.trim());

      //Remove Loader
      MFullScreenloader.stopLoading();

      //Show succes message
      MLoaders.successSnackBar(
          title: 'Email Sent!',
          message: 'Link to reset password sent to your email'.tr);

      //Redirect to next Screen
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      //remove Loader
      MFullScreenloader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh, snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      //Start Loading
      MFullScreenloader.openLoadingDialog(
          'Processing your request...', MImages.docerAnimation);

      //Check Internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenloader.stopLoading();
        return;
      }

      await AuthRepository.instance.sendPasswordResetEmail(email);

      //Remove Loader
      MFullScreenloader.stopLoading();

      //Show succes message
      MLoaders.successSnackBar(
          title: 'Email Sent!',
          message: 'Link to reset password sent to your email'.tr);

    } catch (e) {
      //remove Loader
      MFullScreenloader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh, snap!', message: e.toString());
    }
  }
}
