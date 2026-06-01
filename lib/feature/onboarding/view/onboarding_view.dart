import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../viewmodel/onboarding_viewmodel.dart';
import '../widgets/onboarding_button_widget.dart';
import '../widgets/onboarding_indicator_widget.dart';
import '../widgets/onboarding_page_widget.dart';
import '../../../core/constants/app_strings.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OnboardingViewModel>();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            // ── Top bar ──────────────────────────────────────────────────────
            _TopBar(vm: vm),

            // ── Content ──────────────────────────────────────────────────────
            Expanded(
              child: Stack(
                children: [
                  // Static split background so the bg doesn't animate on swipe
                  const _SplitBackground(),

                  // Scrollable pages + static bottom controls
                  Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: vm.pageController,
                          onPageChanged: vm.onPageChanged,
                          itemCount: vm.pages.length,
                          itemBuilder: (_, index) =>
                              OnboardingPageWidget(page: vm.pages[index]),
                        ),
                      ),

                      // ── Bottom controls ──────────────────────────────────
                      _BottomControls(vm: vm),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Top bar ───────────────────────────────────────────────────────────────────
class _TopBar extends StatelessWidget {
  final OnboardingViewModel vm;
  const _TopBar({required this.vm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button (hidden on first page)
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: vm.isFirstPage ? 0.0 : 1.0,
            child: IconButton(
              onPressed: vm.isFirstPage ? null : vm.previousPage,
              icon: const Icon(Icons.arrow_back_rounded),
              color: const Color.fromARGB(179, 46, 46, 46),
              splashRadius: 24,
            ),
          ),

          // Skip button (hidden on last page)
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: vm.isLastPage ? 0.0 : 1.0,
            child: TextButton(
              onPressed: vm.isLastPage ? null : () => vm.skip(context),
              child: Text(
                AppStrings.skip,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(179, 46, 46, 46),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SplitBackground extends StatelessWidget {
  const _SplitBackground();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 42, child: Container(color: const Color(0xFFF8F9FA))),
        Expanded(flex: 42, child: Container(color: const Color(0xFFF8F9FA))),
      ],
    );
  }
}

// ── Bottom controls ───────────────────────────────────────────────────────────
class _BottomControls extends StatelessWidget {
  final OnboardingViewModel vm;
  const _BottomControls({required this.vm});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F9FA),
      padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 36.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OnboardingIndicatorWidget(
            itemCount: vm.pages.length,
            currentIndex: vm.currentIndex,
          ),
          SizedBox(height: 28.h),
          OnboardingButtonWidget(
            text: vm.buttonLabel,
            isLoading: vm.isLoading,
            onPressed: () => vm.nextPage(context),
          ),
        ],
      ),
    );
  }
}
