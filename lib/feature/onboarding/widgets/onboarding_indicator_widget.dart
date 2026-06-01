import 'package:financial_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingIndicatorWidget extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const OnboardingIndicatorWidget({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        final bool isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          height: 8.h,
          width: isActive ? 28.w : 8.w,
          decoration: BoxDecoration(
            color: isActive ? appcolors.dotActive : appcolors.dotInactive,
            borderRadius: BorderRadius.circular(4.r),
          ),
        );
      }),
    );
  }
}
