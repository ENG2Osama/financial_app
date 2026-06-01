import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/onboarding_model.dart';
import '../../../core/constants/app_strings.dart';

class OnboardingViewModel extends ChangeNotifier {
  // ── Page controller ─────────────────────────────────────────────────────────
  final PageController pageController = PageController();

  // ── State ────────────────────────────────────────────────────────────────────
  int _currentIndex = 0;
  bool _isLoading = false;

  int get currentIndex => _currentIndex;
  bool get isLoading => _isLoading;

  bool get isFirstPage => _currentIndex == 0;
  bool get isLastPage => _currentIndex == pages.length - 1;

  String get buttonLabel =>
      isLastPage ? AppStrings.getStarted : AppStrings.next;

  // ── Onboarding pages data ────────────────────────────────────────────────────
  final List<OnboardingModel> pages = List.generate(
    AppStrings.onboardingTitles.length,
    (i) => OnboardingModel(
      image: AppStrings.onboardingImages[i],
      title: AppStrings.onboardingTitles[i],
      description: AppStrings.onboardingDescriptions[i],
    ),
  );

  // ── Page change ──────────────────────────────────────────────────────────────
  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // ── Navigation ───────────────────────────────────────────────────────────────
  void nextPage(BuildContext context) {
    if (!isLastPage) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding(context);
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
    _completeOnboarding(context);
  }

  // ── Complete & persist ───────────────────────────────────────────────────────
  Future<void> _completeOnboarding(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    await _markOnboardingDone();

    _isLoading = false;
    notifyListeners();

    // TODO: Replace with your actual next-screen navigation, e.g.:
    if (context.mounted)
      Navigator.pushReplacementNamed(context, namePages.login);
    debugPrint('✅ Onboarding complete — navigating to Login');
  }

  Future<void> _markOnboardingDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppStrings.prefOnboardingDone, true);
  }

  // ── Utility: check if already seen ──────────────────────────────────────────
  static Future<bool> hasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(AppStrings.prefOnboardingDone) ?? false;
  }

  // ── Dispose ──────────────────────────────────────────────────────────────────
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
