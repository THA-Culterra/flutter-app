import 'package:culterra/screens/Home/presentation/HomeScreen.dart';
import 'package:culterra/screens/Login/presentation/login_screen.dart';
import 'package:culterra/screens/Login/presentation/login_viewmodel.dart';
import 'package:culterra/screens/Onboarding/presentation/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
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
    User? user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      title: 'Culterra',
      debugShowCheckedModeBanner: false,
      home: (user != null) ? HomeScreen() : LoginScreen(),
    );
  }
}