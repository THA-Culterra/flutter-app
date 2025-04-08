import 'package:culterra/screens/Country/presentation/country_screen.dart';
import 'package:culterra/screens/Onboarding/presentation/onboarding_viewmodel.dart';
import 'package:culterra/screens/Widgets/world_map.dart';
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

  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  
  runApp(ChangeNotifierProvider(
    create: (context) => OnboardingViewModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culterra',
      debugShowCheckedModeBanner: false,
      home:
      // OnboardingScreen(),

      CountryScreen()

      // WorldMap(
      //   onCountryTap: (id, name) {
      //     print("Tapped on country: $name (ID: $id)");
      //   },
      // ),
    );
  }
}