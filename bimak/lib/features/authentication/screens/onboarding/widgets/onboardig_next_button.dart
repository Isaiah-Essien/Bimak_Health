
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utils.dart';
import '../../../../../utils/helpers/helpers_utils.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  // ignore: use_super_parameters
  const OnBoardingNextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Positioned(
      right: MSizes.defaultSpace,
      bottom: MDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () {
          // Calling the nextPage method without any arguments
          final controller = OnBoardingController.instance;
          controller.nextPage();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? MColors.primaryColor : MColors.primaryColor,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
