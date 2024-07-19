
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/auth_repository.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helpers_utils.dart';
import '../../controllers/signup/verify_email_controllers.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailControllers());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        //padding for equal space on all screens
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(
                  image: const AssetImage(MImages.deliveryEmail),
                  width: MHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: MSizes.spaceBtwSects),

              ///Title and subTitle
              Text(
                MTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MSizes.spaceBtwItms,
              ),
              Text(
                email??'',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MSizes.spaceBtwItms,
              ),
              Text(
                MTexts.confirmEmailsSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: MSizes.spaceBtwSects,
              ),

              ///Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.checkEmailVerificationStatus(),
                      child: const Text(MTexts.tContinue))
              ),
              const SizedBox(
                height: MSizes.spaceBtwItms,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () =>controller.sendEmailVerification(), child: const Text(MTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
