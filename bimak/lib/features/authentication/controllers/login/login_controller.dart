import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/auth_repository.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/device/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalisation/controllers/users_controllers.dart';

class LoginController extends GetxController {
  ///Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController=Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL')??'';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD')??'';
    super.onInit();
  }

  ///Email and password SingIn
  Future<void> emailAndPasswordSignIn() async {
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
      if (!loginFormKey.currentState!.validate()) {
        MFullScreenloader.stopLoading();
        return;
      }

      //Save Data if Remember me is checked
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //Login user Email and Password Authentication
      final userCredentials = await AuthRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      MFullScreenloader.stopLoading();

      //Redirect
      AuthRepository.instance.screenRedirect();
    } catch (e) {
      MFullScreenloader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh, Snap!', message: e.toString());
    }
  }

  ///Google SignIn authentication
  Future<void> googleSignIn()async{
    try{
      //Start loading
      MFullScreenloader.openLoadingDialog('Logging you in...', MImages.docerAnimation);

      //check Internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        MFullScreenloader.stopLoading();
        return;
      }

      //Google Authentication
      final userCredentials= await AuthRepository.instance.signInWithGoogle();

      //Save User record
      await userController.saveUserRecord(userCredentials);

      //Remove Loader
      MFullScreenloader.stopLoading();

      //REDIRECT USER
      AuthRepository.instance.screenRedirect();
    }catch(e){
      //Remove Loader
      MFullScreenloader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh, Snap!',message: e.toString());
    }
  }
}
