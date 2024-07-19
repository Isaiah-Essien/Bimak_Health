
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class MLoginTitleAndSubTitle extends StatelessWidget {
  const MLoginTitleAndSubTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: MSizes.sm),
        Text(MTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
