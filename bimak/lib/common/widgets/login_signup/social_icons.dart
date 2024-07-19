import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/images_string.dart';
import '../../../utils/constants/sizes.dart';

class MSocialIcons extends StatelessWidget {
  const MSocialIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () =>controller.googleSignIn(),
            icon: const Image(
              width: MSizes.iconMd,
              height: MSizes.iconMd,
              image: AssetImage(MImages.google),
            ),
          ),
        ),
        const SizedBox(width: MSizes.spaceBtwItms),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: MSizes.iconMd,
              height: MSizes.iconMd,
              image: AssetImage(MImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
