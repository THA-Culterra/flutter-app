import 'dart:ui';

import 'package:flutter/Material.dart';

import '../Country/data/models/role.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({super.key, required this.role});

  final Role role;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF8200D2), Color(0xFF24E2FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(2), // Stroke width
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.asset(
              'lib/core/assets/role_card_bg.png',
              fit: BoxFit.cover,
            ),
            // Blur effect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                color: Colors.white.withOpacity(0.1), // Optional frosty overlay
              ),
            ),
            // Center content
            roleApplier(role),
          ],
        ),
      ),
    );
  }

  Widget roleApplier(Role role) {
    if (role == Role.explorer) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Explorer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'get verified as contributor',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    } else {
      return Stack(
        fit: StackFit.expand,
        children: [
          // Role-specific overlay
          Image.asset(
            'lib/core/assets/${role.name}_illu.png', // e.g., cuisine.png, music.png
            fit: BoxFit.cover,
          ),
          // Role name in center
          Center(
            child: Text(
              role.name[0].toUpperCase() + role.name.substring(1), // Capitalized
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }
}