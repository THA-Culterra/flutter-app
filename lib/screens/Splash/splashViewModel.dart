import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> checkAppStatus(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    // Check if it's the first app use
    bool isFirstUse = prefs.getBool('isFirstUse') ?? true;

    if (isFirstUse) {
      // Set the flag so that it's not the first use anymore
      prefs.setBool('isFirstUse', false);

      // Ensure the widget is still mounted before navigating
      if (!context.mounted) return;

      Future.delayed(const Duration(seconds: 2), () {
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil('/onboarding', (route) => false);
        }
      });
    } else {
      // Check if the user is logged in
      final user = FirebaseAuth.instance.currentUser;

      // Ensure the widget is still mounted before navigating
      if (!context.mounted) return;

      if (user != null) {
        // User is logged in, navigate to home
        Future.delayed(const Duration(seconds: 2), () {
          if (context.mounted) {
            Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
          }
        });
      } else {
        // User is not logged in, navigate to login
        Future.delayed(const Duration(seconds: 2), () {
          if (context.mounted) {
            Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
          }
        });
      }
    }
  }
}