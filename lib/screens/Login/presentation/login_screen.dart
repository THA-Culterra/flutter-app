import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Widgets/gradient_background.dart';
import '../domain/provider.dart';
import 'login_prov_builder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showEmailFields = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  void _onProviderPressed(Provider provider) {
    if (provider == Provider.email) {
      setState(() => showEmailFields = true);
    } else {
      // Handle other providers (Google, Apple, Facebook)
      print("${provider.title} tapped");
      // TODO: Implement provider authentication
    }
  }

  void _onEmailContinuePressed() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    // TODO: Handle email sign in or sign up logic here
    print("Email: $email, Password: $password");
  }

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
          child: Stack(
            children: [
              // Main content
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "lib/core/assets/Logo.svg",
                    width: 116,
                    height: 116,
                  ),
                  const SizedBox(height: 32),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Evolve into a ", style: TextStyle(fontSize: 28, color: Colors.white)),
                        TextSpan(text: "Superhuman", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                        TextSpan(text: " by learning about cultures", style: TextStyle(fontSize: 28, color: Colors.white)),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  if (showEmailFields) ...[
                    TextField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(Icons.email, color: Colors.white),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      obscureText: obscurePassword,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Add login/signup logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF0350),
                        minimumSize: const Size(256, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ] else ...[
                    ...Provider.values.map(
                          (provider) => ProviderButton(
                        provider: provider,
                        onPressed: () => _onProviderPressed(provider),
                      ),
                    ),
                  ],
                  const Spacer(),
                  SvgPicture.asset(
                    "lib/core/assets/THA.svg",
                    width: 90,
                    height: 32,
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "By clicking “Start with Google/Apple ID/Facebook/Email” above, you acknowledge "
                          "that you have read, understood, and agree to Culterra Terms and Privacy Policy.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ],
              ),

              // Back arrow (only when email is selected)
              if (showEmailFields)
                Positioned(
                  top: 0,
                  left: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => setState(() => showEmailFields = false),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}