
// ignore: depend_on_referenced_packages
import 'package:bimak/common/widgets/appbar/appbar.dart';
import 'package:bimak/common/widgets/custom_shapes/circular_image.dart';
import 'package:bimak/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/app_bar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../Subscription/subscription.dart';
import '../../../authentication/screens/login/login.dart';
import '../profile/profile.dart';

// This class is the Settings page routed to the Bottom navigation
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // User profile
            MPrimaryHeaderContainer(
                child: Column(
                  children: [
                    MAppBar(title: Text('Settings', style: Theme.of(context).textTheme.headlineMedium!.apply(color: MColors.light))),
                    const SizedBox(height: MSizes.spaceBtwSects),
                    ListTile(
                      // leading: MCircularImage(),
                    ),
                  ],
            )),

            // Body
            Padding(
              padding: const EdgeInsets.all(MSizes.defaultSpace),
              child: Column(
                children: [
                  // Account Settings
                  const MSectionHeading(title: 'Account Settings'),
                  const SizedBox(height: MSizes.spaceBtwItms),

                  MSettingMenuTile(icon: Iconsax.location, title: 'Location', subTitle: 'Set Location',trailing: const Icon(Icons.arrow_forward_ios),onTap: (){},),
                  MSettingMenuTile(icon: Iconsax.wallet, title: 'Subscribe to Premium', subTitle: 'Select your preferred payment method',trailing: const Icon(Icons.arrow_forward_ios),onTap: ()=>Get.to(()=>const SubscriptionPage()),),
                  MSettingMenuTile(icon: Iconsax.health1, title: 'Dietary preference', subTitle: 'Set your dietary needs',trailing: const Icon(Icons.arrow_forward_ios),onTap: ()=>Get.to(()=>const ProfileScreen()),),
                  MSettingMenuTile(icon: Iconsax.health5, title: 'Allergen Information', subTitle: 'Set your Allergies',trailing: const Icon(Icons.arrow_forward_ios),onTap: () => Get.to(() => const ProfileScreen()),),
                  MSettingMenuTile(icon: Iconsax.health4, title: 'Health Concerns', subTitle: 'Set your Health concerns',trailing: const Icon(Icons.arrow_forward_ios),onTap: () => Get.to(() => const ProfileScreen()),),

                  MSettingMenuTile(icon: Iconsax.logout, title: 'Logout', subTitle: 'Sign out',trailing: const Icon(Icons.arrow_forward_ios),onTap: ()=>Get.to(()=>const LoginScreen())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
