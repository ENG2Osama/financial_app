import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/appColors.dart';
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
      backgroundColor: appColors.bgWhite,
      body: SafeArea(
        child: Column(
          children: [

            Container(
              color: appColors.bgWhite,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: vm.isFirstPage ? 0.0 : 1.0,
                    child: IconButton(
                      onPressed: vm.isFirstPage ? null : vm.previousPage,
                      icon: const Icon(Icons.arrow_back_rounded),
                      color: appColors.textPrimary,
                    ),
                  ),

                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: vm.isLastPage ? 0.0 : 1.0,
                    child: TextButton(
                      onPressed: vm.isLastPage ? null : () => vm.skip(context),
                      child:  Text(
                        AppStrings.skip,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: appColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Column(
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

                  Container(
                    color: appColors.bgLight,
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 36),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        OnboardingIndicatorWidget(
                          itemCount: vm.pages.length,
                          currentIndex: vm.currentIndex,
                        ),
                        const SizedBox(height: 28),
                        OnboardingButtonWidget(
                          text: vm.buttonLabel,
                          onPressed: () => vm.nextPage(context),
                        ),
                      ],
                    ),
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
