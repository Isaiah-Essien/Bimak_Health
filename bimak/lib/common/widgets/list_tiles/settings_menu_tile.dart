import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class MSettingMenuTile extends StatelessWidget {
  const MSettingMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            Colors.black.withOpacity(0.06), // Adjust opacity for glassy effect
        borderRadius: BorderRadius.circular(10),
        border: Border(
          bottom: BorderSide(
              color: Colors.grey.withOpacity(0.3)), // Underline effect
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        leading: Icon(
          icon,
          size: 28,
          color: MColors.primaryColor,
        ),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle:
            Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
