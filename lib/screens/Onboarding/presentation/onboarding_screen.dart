import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'onboarding_icon.dart';
import 'onboarding_viewmodel.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OnboardingViewModel>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.50, -0.00),
            end: Alignment(0.50, 1.00),
            colors: [Color(0xFF54C2F8), Color(0xFF0D278F)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 16),
            OnboardingIcon(icon: viewModel.getCurrentPage().icon),
            SizedBox(height: 20),

            Text(
              "Welcome to Culterra",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            GestureDetector(
              onTap: viewModel.nextPage,
              child: Container(
                width: 262,
                height: 355,
                decoration: BoxDecoration(
                  color: Color(0xFF0E288F),
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                viewModel.getCurrentPage().description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == viewModel.currentPage
                        ? Colors.white
                        : Colors.white.withOpacity(0.6),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),

            viewModel.currentPage == 2
                ? GestureDetector(
              onTap: () {},
              child: Container(
                width: 256,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xFFFF0350),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
                : SvgPicture.asset(
              'lib/core/assets/THA.svg',
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}