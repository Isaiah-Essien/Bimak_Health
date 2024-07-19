import 'package:flutter/material.dart';

import '../../../../../utils/constants/images_string.dart';

class MAuthLogo extends StatelessWidget {
  const MAuthLogo({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
        height: 180,
        image: AssetImage(dark ? MImages.lightLogo : MImages.darkLogo),
      ),
    );
  }
}
