class OnboardingPage {
  final String title;
  final String description;
  final String icon;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class OnboardingPages extends Iterable<OnboardingPage> {
  final List<OnboardingPage> pages;

  OnboardingPages(this.pages);

  @override
  Iterator<OnboardingPage> get iterator => pages.iterator;
}