import 'package:flutter/material.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../common/widgets/notification_icon.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/text_strings.dart';

class MHomeAppBar extends StatelessWidget {
  const MHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MTexts.homeAppbarTitle,style: Theme.of(context).textTheme.labelMedium!.apply(color: MColors.grey)),
          Text(MTexts.homeAppbarSubtitle,style: Theme.of(context).textTheme.headlineSmall!.apply(color: MColors.light)),
        ],
      ),
      actions: [
        MNotificationIcon(onPressed: () {  }, iconColor: MColors.light)

      ],
    );
  }
}