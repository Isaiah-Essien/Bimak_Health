import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart'; // Import the Get package

import '../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../common/widgets/custom_shapes/container/search_container.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utils.dart';
import '../Diagnose/diagnose.dart';
import 'home_appbar.dart'; // Import the DiagnoseScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MPrimaryHeaderContainer(
              child: Column(
                children: [
                  const MHomeAppBar(),
                  const SizedBox(height: MSizes.spaceBtwSects),

                  ///---------Search bar-------//
                  const MSearchBar(text: 'Search your diagnosis'),
                  const SizedBox(height: MSizes.spaceBtwSects),
                  Padding(
                    padding: const EdgeInsets.only(left: MSizes.defaultSpace),
                    child: Column(
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Fast medical diagnostics',
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          totalRepeatCount: 1,
                        ),
                        const SizedBox(height: 20), // Add some space between the animation and the button

                        ///---------Diagnose Button-------//
                        Center(
                          child: SizedBox(
                            width: 200, // Fixed width for the button
                            child: ElevatedButton(
                              onPressed: () =>
                                  Get.to(() => const DiagnoseScreen(), transition: Transition.rightToLeft),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: MColors.primaryColor,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Go to Diagnose',
                                style: TextStyle(
                                  color: MColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: MSizes.spaceBtwSects*2),
                ],
              ),
            ),
            const SizedBox(height: 20),

            ///---------Image Slider-------//
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: MSizes.defaultSpace),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(milliseconds: 500),
                      viewportFraction: 0.8,
                    ),
                    items: [
                      'assets/images/img_1.jpg',
                      'assets/images/img_2.jpg',
                      'assets/images/img_3.jpg',
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 5,
                              ),
                              image: DecorationImage(
                                image: AssetImage(i),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: MColors.primaryColor.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  ///---------Explore Text-------//
                  Text(
                    'Bimak AI is a go to for quick diagnostics',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
