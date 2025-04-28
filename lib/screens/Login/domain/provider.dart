import 'package:flutter/material.dart';

enum LoginProvider {
  google(
    title: "Google",
    icon: "google",
    colors: [Color(0xFFF65339), Color(0xFFF68262)],
  ),
  facebook(
    title: "Facebook",
    icon: "facebook",
    colors: [Color(0xFF1D24FF), Color(0xFF4744FB)],
  ),
  apple(
    title: "Apple",
    icon: "apple",
    colors: [Color(0xFF000000), Color(0xFF333333)],
  ),
  email(
    title: "Email",
    icon: "email",
    colors: [Color(0xFF8539F6), Color(0xFF9E62F6)],
  );

  final String title;
  final String icon;
  final List<Color> colors;

  const LoginProvider({
    required this.title,
    required this.icon,
    required this.colors,
  });
}