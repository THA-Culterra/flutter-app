import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingIcon extends StatelessWidget {
  final String icon;
  const OnboardingIcon({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF0E288F),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SvgPicture.asset('lib/core/assets/$icon.svg'),
    );
  }
}