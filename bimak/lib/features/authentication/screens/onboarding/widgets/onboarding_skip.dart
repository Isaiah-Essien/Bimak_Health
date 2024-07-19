
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utils.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  // ignore: use_super_parameters
  const OnBoardingSkip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MDeviceUtils.getAppBarHeight(),
      right: MSizes.defaultSpace,
      child: TextButton(
        
        onPressed: () {
          // Calling the skipPage method
          OnBoardingController.instance.skipPage();
        },
        child: const Text('Skip',
          style: TextStyle(color: MColors.primaryColor),
        ),
        
        
      ),
    );
  }
}
