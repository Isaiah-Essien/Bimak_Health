
import 'package:bimak/features/personalisation/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/circular_image.dart';
import '../../../../utils/constants/app_bar.dart';
import '../../../../utils/constants/images_string.dart';
import '../../../../utils/constants/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../authentication/screens/signup/signup.dart';

//--------------The main Profile screen that is routed to the Bottom navigation-------//
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(heading: 'Profile',),

      ///Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              ///Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const MCircularImage(
                        image: MImages.userKanayo, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              ///Details-----------------///
              const SizedBox(height: MSizes.spaceBtwItms / 2),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItms),

              ///Heading Profile Information
              const MSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItms/2),

              MProfileMenu(onPressed: () {}, title: 'Name', value: 'Isaiah Essien',),
              MProfileMenu(onPressed: () {}, title: 'Username', value: 'UbBobo',),

              const SizedBox(height: MSizes.spaceBtwItms / 2),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItms),

              ///Heading Personal Information
              const MSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItms),

              MProfileMenu(onPressed: () {}, title: 'User ID', value: '12345',icon: Iconsax.copy,),
              MProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male',),
              MProfileMenu(onPressed: () {}, title: 'Email', value: 'i.essien@alustudent.com',),
              MProfileMenu(onPressed: () {}, title: 'Phone Number', value: '+234-815-5017-489',),
              MProfileMenu(onPressed: () {}, title: 'Date of Birth', value: 'June 12th, 1956',),

              const SizedBox(height: MSizes.spaceBtwItms / 2),
              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItms),

              ///HEalth Personal Information
              const MSectionHeading(
                  title: 'Health Information', showActionButton: false),
              const SizedBox(height: MSizes.spaceBtwItms),

              MProfileMenu(onPressed: () {}, title: 'Weight', value: '90Kg',),
              MProfileMenu(onPressed: () {}, title: 'Allergien Information', value: 'Lactose Intolerant',),
              MProfileMenu(onPressed: () {}, title: 'Dietary preference', value: 'Low Sugar Diets',),
              MProfileMenu(onPressed: () {}, title: 'Health Concerns', value: 'Obesity',),

              const Divider(),
              const SizedBox(height: MSizes.spaceBtwItms,),

              ///Logout
              Center(
                child: TextButton(
                  onPressed: ()=>Get.to(()=>const SignupScreen()),
                  child: const Text('Delete Account', style: TextStyle(color: Colors.red),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

