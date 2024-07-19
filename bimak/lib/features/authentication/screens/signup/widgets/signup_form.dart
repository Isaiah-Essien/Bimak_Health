
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../controllers/signup/signup_controller.dart';
import '../../login/login.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          ///First and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => MValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: MTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: MSizes.spaceBtwinputfield),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      MValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: MTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: MSizes.spaceBtwinputfield),

          ///Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                MValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: MTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: MSizes.spaceBtwinputfield),

          ///Email
          TextFormField(
            controller: controller.email,
            validator: (value) =>
                MValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: MTexts.email,
                prefixIcon: Icon(Iconsax.direct_right)),
          ),
          const SizedBox(height: MSizes.spaceBtwinputfield),

          ///Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) =>
                MValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: MTexts.phoneNumber, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: MSizes.spaceBtwinputfield),

          ///Password
          Obx(
            ()=> TextFormField(
              controller: controller.password,
              validator: (value) =>
                  MValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration:  InputDecoration(
                labelText: MTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: ()=>controller.hidePassword.value=!controller.hidePassword.value,
                  icon:  Icon(controller.hidePassword.value?Iconsax.eye_slash:Iconsax.eye)
                ),
              ),
            ),
          ),
          const SizedBox(height: MSizes.spaceBtwSects),

          ///Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(MTexts.signUp),
            ),
          ),
          Row(
            children: [
              const Text(MTexts.alreadyHaveAnAccount),
              const SizedBox(width: MSizes.spaceBtwItms),
              TextButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: const Text(
                    MTexts.logIn,
                    style: TextStyle(color: MColors.primaryColor),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
