import 'package:flutter/material.dart';
import '../../../core/constants/appColors.dart';
import '../model/onboarding_model.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingModel page;

  const OnboardingPageWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 58,
          child: Container(
            width: double.infinity,
            color: appColors.bgWhite,
            padding: const EdgeInsets.all(24),
            child: Image.asset(
              page.image,
              fit: BoxFit.contain,
            ),
          ),
        ),

        Expanded(
          flex: 42,
          child: Container(
            width: double.infinity,
            color: appColors.bgLight,
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  page.title,
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: appColors.textPrimary,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  page.description,
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: appColors.textSecondary,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
