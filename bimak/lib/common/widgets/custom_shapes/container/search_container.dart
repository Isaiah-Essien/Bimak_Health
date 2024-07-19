import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utils.dart';
import '../../../../utils/helpers/helpers_utils.dart';

class MSearchBar extends StatelessWidget {
  const MSearchBar({
    super.key, required this.text, this.icon=Iconsax.search_normal, this.showBackground=true, this.showBorder=true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark= MHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
      child: Container(
        width: MDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(MSizes.md),
        decoration: BoxDecoration(
          color: showBackground?dark?MColors.dark:MColors.light:Colors.transparent,
          borderRadius: BorderRadius.circular(MSizes.cardradiusLg),
          border: showBorder?Border.all(color: MColors.grey):null,
        ),
        child:  Row(
          children: [
            Icon(icon,color: MColors.grey),
            const SizedBox(width: MSizes.spaceBtwinputfield),
            Text(text,style: Theme.of(context).textTheme.bodySmall,),
          ],
        ),
      ),
    );
  }
}