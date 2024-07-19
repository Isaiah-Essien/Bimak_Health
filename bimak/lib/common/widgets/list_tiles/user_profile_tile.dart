
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_string.dart';
import '../custom_shapes/circular_image.dart';

//--------------This class is an extracted widget for the user profile-----------//
class MUserProfileTile extends StatelessWidget {
  const MUserProfileTile({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const MCircularImage(
        image: MImages.userKanayo,
        width: 55,
        height: 100,
        padding: 0,
        backgroundColor: MColors.primaryColor,
      ),
      title: Text('Isaiah Essien',
          style: Theme.of(context).textTheme.headlineSmall!),
      subtitle: Text('+250791983005',
          style: Theme.of(context).textTheme.bodyMedium!),
      trailing: ElevatedButton(onPressed: onPressed, child: const Text('Edit')),
    );
  }
}