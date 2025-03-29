import 'package:flutter/material.dart';
import '../domain/entities.dart';

class OnboardingViewModel extends ChangeNotifier {
  int _currentPage = 0;
  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: "Welcome to Culterra",
      description: "Culterra is a culture learning app, discover the whole world right from your phone",
      icon: "book",
    ),
    OnboardingPage(
      title: "Learn & Explore",
      description: "Culterra is a travel guide that you can use on the go, even offline!",
      icon: "airplane-square",
    ),
    OnboardingPage(
      title: "Start Your Journey",
      description: "Culterra is a trustable source of information, you learn right from the locals",
      icon: "shield-tick",
    ),
  ];

  int get currentPage => _currentPage;
  int get totalPages => _pages.length;
  List<OnboardingPage> get pages => _pages;

  void nextPage() {
    if (_currentPage < _pages.length - 1) {
      _currentPage++;
      notifyListeners();
    }
  }

  OnboardingPage getCurrentPage() {
    return _pages[currentPage];
  }

  void setPage(int index) {
    _currentPage = index;
    notifyListeners();
  }
}