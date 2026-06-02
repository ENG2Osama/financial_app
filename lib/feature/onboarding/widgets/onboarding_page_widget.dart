import 'package:financial_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/onboarding_model.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingModel page;

  const OnboardingPageWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // الصورة — خلفية سوداء تتطابق مع خلفية الـ PNG
        Expanded(
          flex: 58,
          child: Container(
            width: double.infinity,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Image.asset(page.image, fit: BoxFit.contain),
          ),
        ),

        // النص — خلفية فاتحة
        Expanded(
          flex: 42,
          child: Container(
            width: double.infinity,
            color: const Color(0xFFF8F9FA),
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                Text(
                  page.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w800,
                    color: appColors.textPrimary,
                    height: 1.25,
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  page.description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
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
