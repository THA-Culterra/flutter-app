import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Widgets/gradient_background.dart';
import '../domain/provider.dart';
import 'login_prov_builder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double verticalPadding = MediaQuery.of(context).padding.top + 16;

    return Scaffold(
      body: GradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              SvgPicture.asset(
                "lib/core/assets/Logo.svg",
                width: 116,
                height: 116,
              ),
              const SizedBox(height: 32),

              // Title Text
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Evolve into a ",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                        color: Colors.white
                      ),
                    ),
                    TextSpan(
                      text: "Superhuman",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    TextSpan(
                      text: " by learning about cultures",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Provider Buttons
              ...Provider.values.map(
                (provider) => ProviderButton(
                  provider: provider,
                  // TODO: Implement onPressed
                  onPressed: () => print("${provider.title} tapped"),
                ),
              ),
              const Spacer(),

              // THA Logo
              SvgPicture.asset(
                "lib/core/assets/THA.svg",
                width: 90,
                height: 32,
              ),
              const SizedBox(height: 16),

              // Terms & Privacy Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "By clicking “Start with Google/Apple ID/Facebook/Email” above, you acknowledge "
                  "that you have read, understood, and agree to Culterra Terms and Privacy Policy.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
