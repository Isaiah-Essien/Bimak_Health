
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/auth_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalisation/models/user_model.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///variables
  final hidePassword = true.obs; // hide password
  final email = TextEditingController(); //controller for email input
  final lastName = TextEditingController(); //controller for Last Name input
  final firstName = TextEditingController(); //controller for first Name input
  final password = TextEditingController(); //controller for password input
  final username = TextEditingController(); //controller for user name input
  final phoneNumber = TextEditingController(); //controller for Phone Number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); //form key for Form validation

  //Signup
  void signup() async {
    try {
      //start Loading
      MFullScreenloader.openLoadingDialog(
          'BODFiT is processing your information...', MImages.docerAnimation);

      //Check Internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenloader.stopLoading();
        return;
      }

      //Form Validation
      if (!signupFormKey.currentState!.validate()) {
        MFullScreenloader.stopLoading();
        return;
      }

      //Register user in the Firebase Authentication and Save user data in firebase
      final userCredential = await AuthRepository.instance.registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      //Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove Loader
      MFullScreenloader.stopLoading();

      //Show success message
      MLoaders.successSnackBar(
          title: 'Congratulations',
          message:
              'Your account has been created! Verify your email to continue!');

      //Move to Verify email Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      //Remove Loader
      MFullScreenloader.stopLoading();

      //Show some Generic Error to user
      MLoaders.errorSnackBar(
          title: MTexts.errorSnackBar, message: e.toString());
    }
  }
}
