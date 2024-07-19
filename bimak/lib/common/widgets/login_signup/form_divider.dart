
import 'package:flutter/material.dart';

import '../../../utils/helpers/helpers_utils.dart';

class MFormDivider extends StatelessWidget {
  const MFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
                color: dark ? Colors.blueGrey : Colors.grey,
                thickness: 0.5,
                indent: 60,
                endIndent: 5)),
        Text(dividerText,
            style: Theme.of(context).textTheme.labelMedium),
        Flexible(
            child: Divider(
                color: dark ? Colors.blueGrey : Colors.grey,
                thickness: 0.5,
                indent: 5,
                endIndent: 60)),
      ],
    );
  }
}
