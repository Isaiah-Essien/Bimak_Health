import 'package:bimak/features/Diagnose/diagnose.dart';
import 'package:bimak/features/Home/home.dart';
import 'package:bimak/features/Prediction/predict.dart';
import 'package:bimak/features/personalisation/screens/settings/settings.dart';
import 'package:bimak/utils/constants/colors.dart';
import 'package:bimak/utils/helpers/helpers_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

//----------Custom Bottom Navigation -----------//
class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = MHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: darkMode ? MColors.dark : MColors.light,
            indicatorColor: darkMode
                ? MColors.light.withOpacity(0.1)
                : MColors.dark.withOpacity(0.1),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Iconsax.text), label: 'Chat'),
              NavigationDestination(
                  icon: Icon(Iconsax.health), label: 'Diagnose'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          )),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    //Using containers and colors as placeholders for the various screens yet to be created
    // for DASHBORAD, FITNESS, WORKOUT, and PROFILE

    const HomeScreen(),
    const ChatScreen(),
    const DiagnoseScreen(),
    const SettingsScreen(),
  ];
}
