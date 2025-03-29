import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../domain/provider.dart';

class ProviderButton extends StatelessWidget {
  final Provider provider;
  final VoidCallback onPressed;

  const ProviderButton({
    super.key,
    required this.provider,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: provider.colors.length > 1
              ? provider.colors
              : [provider.colors.first, provider.colors.first], // Fallback for single color
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16), // Adds 16 padding from both sides
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "lib/core/assets/${provider.icon}.svg",
                    width: 24,
                    height: 24,
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        provider.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
