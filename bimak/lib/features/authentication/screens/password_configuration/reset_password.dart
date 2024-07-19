
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helpers_utils.dart';
import '../../controllers/forget_password/forget_password_controller.dart';
import '../login/login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Center(
                child: Image(
                    image: const AssetImage(MImages.reset),
                    width: MHelperFunctions.screenWidth() * 0.6),
              ),
              const SizedBox(height: MSizes.spaceBtwSects / 2),

              ///Email, title, and Password
              Text(
                email,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MSizes.spaceBtwItms,
              ),
              Text(
                MTexts.changeYourpasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                MTexts.changeYourpasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MSizes.spaceBtwSects,
              ),

              ///Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>Get.offAll(()=>const LoginScreen()), child: const Text(MTexts.done))),
              const SizedBox(height: MSizes.spaceBtwItms),

              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () =>ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(MTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
