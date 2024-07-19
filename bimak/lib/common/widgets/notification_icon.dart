import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';

class MNotificationIcon extends StatelessWidget {
  const MNotificationIcon({
    super.key, required this.onPressed, required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon:  Icon(Iconsax.volume_high,color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: MColors.dark,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text('2',style: Theme.of(context).textTheme.labelLarge!.apply(color:MColors.light,fontSizeFactor: 0.8)),
            ),
          ),
        )
      ],
    );
  }
}