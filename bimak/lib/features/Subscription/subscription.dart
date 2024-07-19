import 'package:flutter/material.dart';

import '../../utils/constants/app_bar.dart'; // Adjust path if necessary
import '../../utils/constants/sizes.dart'; // Adjust path if necessary
import '../../utils/constants/colors.dart'; // Adjust path if necessary

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if Bimak is in dark mode
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const MyAppBar(
        heading: 'Get Premium',
        showBackArrow: false,
        showCloseIcon: true,
        showAvatar: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
             Text(
              'Unlock the Full potential of Bimak app',
              style: Theme.of(context).textTheme.headlineSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            // GIF below the text
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                'assets/gifs/subscribe.gif',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Annual subscription container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: MColors.primaryColor, // Primary color for the annual subscription
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Annual',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: MSizes.spaceBtwSects / 2),
                      Text(
                        'First 30 days free - Then \$50/Year',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                  // Best value tag in the annual box
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Best Value',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Monthly subscription container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade900,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white), // White outline
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Monthly',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'First 7 days free - Then \$10/Month',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Button to start the free trial
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: MColors.primaryColor, // Use primary color for button
              ),
              child: const Text('Start 7-day Free Trial'),
            ),
            const SizedBox(height: 20),
            // Terms and conditions text
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'By placing this order, you agree to the ',
                style: TextStyle(fontSize: 12, color: isDarkMode ? Colors.white : Colors.black),
                children: [
                  const TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(fontSize: 12, color: isDarkMode ? Colors.white : Colors.black),
                  ),
                  const TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(color: Colors.yellow),
                  ),
                  TextSpan(
                    text: '. Subscriptions automatically renew unless cancelled at least 24 hours before the end of the current period.',
                    style: TextStyle(fontSize: 12, color: isDarkMode ? Colors.white : Colors.black),
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
