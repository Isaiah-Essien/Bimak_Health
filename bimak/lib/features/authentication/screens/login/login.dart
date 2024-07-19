
import 'package:bimak/features/authentication/screens/login/widgets/auth_logo.dart';
import 'package:bimak/features/authentication/screens/login/widgets/login_form.dart';
import 'package:bimak/features/authentication/screens/login/widgets/login_title_and_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_icons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helpers_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo
              MAuthLogo(dark: dark),
              // const SizedBox(height: MSizes.spaceBtwSects),

              ///Title and subtitle
              const MLoginTitleAndSubTitle(),

              ///Form
              const MloginForm(),

              ///Divider
              MFormDivider(dividerText: MTexts.orSigninWith.capitalize!),
              const SizedBox(height: MSizes.spaceBtwSects),

              ///Footer: Social icons for Login
              const MSocialIcons()
            ],
          ),
        ),
      ),
    );
  }
}
