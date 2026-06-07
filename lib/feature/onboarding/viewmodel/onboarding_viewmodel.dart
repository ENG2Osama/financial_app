import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_strings.dart';
import '../model/onboarding_model.dart';

class OnboardingViewModel extends ChangeNotifier {
  static const String _onboardingKey = 'has_seen_onboarding';

  final PageController pageController = PageController();

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool get isFirstPage => _currentIndex == 0;
  bool get isLastPage => _currentIndex == pages.length - 1;
  String get buttonLabel => isLastPage ? AppStrings.getStarted : AppStrings.next;

  final List<OnboardingModel> pages = List.generate(
    AppStrings.onboardingTitles.length,
        (i) => OnboardingModel(
      image: AppStrings.onboardingImages[i],
      title: AppStrings.onboardingTitles[i],
      description: AppStrings.onboardingDescriptions[i],
    ),
  );

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void nextPage(BuildContext context) {
    if (!isLastPage) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();

      Navigator.pushReplacementNamed(context, namePages.login);
    }
  }

  void previousPage() {
    if (!isFirstPage) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void skip(BuildContext context) {
    _completeOnboarding();
    Navigator.pushReplacementNamed(context, namePages.login);
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingKey, true);
  }

  static Future<bool> hasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingKey) ?? false;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}