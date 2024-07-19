// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'colors.dart';

class DashNav extends StatelessWidget implements PreferredSizeWidget {
  const DashNav({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MColors.lightGrey,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          width: 60,
          height: 60,
          color: MColors.primaryColor,
        ),
      ),
      title: const Column(
        children: [
          Text('Welcome Back!'),
          Text('Kanayo O Kanayo'),
        ],
      ),
      actions: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: MColors.grey,
          ),
          child: const Center(child: Icon(Icons.search_rounded)),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: MColors.grey,
          ),
          child: const Center(child: Icon(Iconsax.notification)),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}
