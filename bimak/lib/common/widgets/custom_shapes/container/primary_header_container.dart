import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_shapes/curved_edges_widget.dart';
import 'circular_container.dart';

class MPrimaryHeaderContainer extends StatelessWidget {
  const MPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MCurvedEdgesWidget(
      child: Container(
        color: MColors.primaryColor,

        child: Stack(
          children: [
            Positioned(top: -150,right: -250,child: MCircularContainer(backgroundColor: MColors.light.withOpacity(0.1))),
            Positioned(top: 100,right: -300,child: MCircularContainer(backgroundColor: MColors.light.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}