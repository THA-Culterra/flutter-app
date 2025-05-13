import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/Home/presentation/HomeScreen.dart';
import 'screens/Login/presentation/login_screen.dart';
import 'screens/Login/presentation/login_viewmodel.dart';
import 'screens/Onboarding/presentation/onboarding_screen.dart';
import 'screens/Onboarding/presentation/onboarding_viewmodel.dart';
import 'screens/Splash/splash.dart';
import 'screens/Splash/splashViewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        ChangeNotifierProvider(create: (_) => OnboardingViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/splash': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
      },
      title: 'Culterra',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen()
    );
  }
}