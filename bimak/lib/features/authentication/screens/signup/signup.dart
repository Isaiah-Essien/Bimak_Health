
import 'package:bimak/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_icons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helpers_utils.dart';
import '../login/widgets/auth_logo.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Scaffold(
      // appBar: AppBar(),
      
      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace/2),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MAuthLogo(dark: dark),
              /// Title
              Text(MTexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: MSizes.spaceBtwSects),

              ///Form
              const SignUpForm(),
              const SizedBox(height: MSizes.spaceBtwSects),

              ///Divider
              MFormDivider(dividerText: MTexts.orSignUpWith.capitalize!),
              const SizedBox(height: MSizes.spaceBtwSects),

              ///Social Icons for Signup
              const MSocialIcons(),
            ],
          ),
        ),
      ),
    );
  }
}
