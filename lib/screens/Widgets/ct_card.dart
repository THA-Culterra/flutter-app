import 'package:flutter/material.dart';
class CTCard extends StatelessWidget {
  const CTCard({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(children: [
            Image.asset(
              width: 120,
              height: 150,
              'lib/core/assets/Couscous.png',
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.8), // Adjust opacity if needed
            ),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.6), // Dark at bottom
                      Colors.transparent, // Fully transparent at top
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),

        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
              "Couscous",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.none,
              )
          ),
        )
      ],
    );
  }
}