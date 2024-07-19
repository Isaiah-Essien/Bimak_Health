import 'package:flutter/material.dart';

import 'images_string.dart';

// This class defines the Custom Appbar
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String heading;
  final bool showAvatar;
  final String? page;
  final bool showBackArrow; // Boolean for showing back arrow
  final bool showCloseIcon; // Boolean for showing close icon

  const MyAppBar({
    super.key,
    required this.heading,
    this.showAvatar = false, // Default value is false
    this.page,
    this.showBackArrow = false, // Default value is false
    this.showCloseIcon = false, // Default value is false
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      leading: showCloseIcon
          ? IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            )
          : showBackArrow
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null,
      iconTheme: IconThemeData(
        color: Theme.of(context).iconTheme.color,
        size: 30,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              heading,
              style: Theme.of(context).textTheme.headlineMedium!,
              textAlign: TextAlign.center,
            ),
          ),
          if (showAvatar)
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                backgroundColor: Color(0xff29A0E3),
                radius: 20,
                child: CircleAvatar(
                  backgroundImage: AssetImage(MImages.userKanayo),
                  radius: 18,
                ),
              ),
            ),
        ],
      ),
      actions: showAvatar ? [] : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
