class AppStrings {
  AppStrings._();

  // App
  static const String appName = 'WalletPay';

  // Onboarding
  static const String skip = 'Skip';
  static const String next = 'Next';
  static const String getStarted = 'Get Started';

  static const List<String> onboardingTitles = [
    'Send Money\nInstantly',
    'Track Every\nTransaction',
    'Your Money,\nSecured',
  ];

  static const List<String> onboardingDescriptions = [
    'Transfer funds to anyone, anywhere in\nthe world in just a few taps.',
    'Get a clear view of where your money\ngoes with smart spending insights.',
    'Bank-grade encryption keeps your\nfinances safe around the clock.',
  ];

  static const List<String> onboardingImages = [
    'assets/images/onboarding1.png',
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png',
  ];

  // Shared Prefs Keys
  static const String prefOnboardingDone = 'onboarding_done';
}
