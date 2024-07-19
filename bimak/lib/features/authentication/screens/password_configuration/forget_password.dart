
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helpers_utils.dart';
import '../../../../utils/validators/validators.dart';
import '../../controllers/forget_password/forget_password_controller.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Center(
                child: Image(
                    image: const AssetImage(MImages.thinking),
                    width: MHelperFunctions.screenWidth() * 0.6),
              ),
              const SizedBox(height: MSizes.spaceBtwSects/2),
              ///Headings
              Text(MTexts.forgtPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              const SizedBox(height: MSizes.spaceBtwItms),
              Text(MTexts.forgtPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: MSizes.spaceBtwSects*2),
        
              ///Text Field
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator: MValidator.validateEmail,
                  decoration: const InputDecoration(
                    labelText: MTexts.email,prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
              ),
              const SizedBox(height: MSizes.spaceBtwSects),
        
              ///Submit Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>controller.sendPasswordResetEmail(), child: const Text(MTexts.submit))),
            ],
          ),
        ),
      ),
    );
  }
}