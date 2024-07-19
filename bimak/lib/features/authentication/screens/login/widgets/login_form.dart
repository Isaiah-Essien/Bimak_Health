import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validators.dart';
import '../../../controllers/login/login_controller.dart';
import '../../password_configuration/forget_password.dart';
import '../../signup/signup.dart';

class MloginForm extends StatelessWidget {
  const MloginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Accessing the LoginController
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MSizes.spaceBtwSects),
        child: Column(
          children: [
            ///Email
            TextFormField(
              validator: (value) => MValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: MTexts.email,
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwinputfield),

            ///Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => MValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: MTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwinputfield / 2),

            ///Remember Me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember me
                Row(
                  children: [
                    ///Checkbox
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                        activeColor: MColors.primaryColor,
                      ),
                    ),
                    const Text(
                      MTexts.rememberMe,
                      style: TextStyle(color: MColors.primaryColor),
                    ),
                  ],
                ),

                ///Forget password
                TextButton(
                  onPressed: () => Get.to(() => const Forgetpassword()),
                  child: const Text(MTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: MSizes.spaceBtwSects),

            ///Log In button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(MTexts.logIn),
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwItms),

            ///Create account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(MTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
