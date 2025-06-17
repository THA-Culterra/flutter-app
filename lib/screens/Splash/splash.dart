import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'splashViewModel.dart'; // Import the ViewModel

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Call checkAppStatus when SplashScreen is built
    Future.delayed(Duration.zero, () {
      context.read<SplashViewModel>().checkAppStatus(context);
    });

    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background (Now placed first, so it's behind everything)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.50, -0.00),
                end: Alignment(0.50, 1.00),
                colors: [Color(0xFF54C2F8), Color(0xFF0D278F)],
              ),
            ),
          ),

          // World Map on Top of the Gradient
          SizedBox.expand(
            child: Image.asset(
              'lib/core/assets/World.png',
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(
                0.8,
              ), // Adjust opacity if needed
            ),
          ),

          // Content (Logo and Text)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Image.asset(
                    'lib/core/assets/Logo.png',
                    width: 154,
                    height: 236,
                  ),
                ),
              ), // Logo in the middle
              Expanded(
                child: Center(
                  child: SvgPicture.asset('lib/core/assets/THA_Splash.svg'),
                ),
              ), // Text at the bottom
            ],
          ),
        ],
      ),
    );
  }
}
