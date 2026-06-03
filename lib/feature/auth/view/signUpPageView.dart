import 'package:financial_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../viewmodel/signUpViewModel.dart';
import '../widgets/customTextFieldWidget.dart';
import '../widgets/customButtonWidget.dart';

class SignUpPageView extends StatelessWidget {
  const SignUpPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return _SignUpContent();
  }
}

class _SignUpContent extends StatelessWidget {
  const _SignUpContent();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SignUpViewModel>();

    return Scaffold(
      backgroundColor: appColors.bgWhite,
      appBar: AppBar(
        backgroundColor: appColors.bgWhite,
        elevation: 0,
        leadingWidth: 56.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: GestureDetector(
            onTap: () => Navigator.of(context).maybePop(),
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: const BoxDecoration(
                color: appColors.bgCard,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                color: appColors.textPrimary,
                size: 20.sp,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Center(
              child: Text(
                'Help',
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: appColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Form(
          key: vm.formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),

                // ── Title ─────────────────────────────────────────────────────
                Text(
                  'Create your\naccount',
                  style: GoogleFonts.inter(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w800,
                    color: appColors.textPrimary,
                    height: 1.15,
                    letterSpacing: -0.5,
                  ),
                ),

                SizedBox(height: 40.h),

                // ── First name ────────────────────────────────────────────────
                CustomTextFieldWidget(
                  controller: vm.firstNameController,
                  hintText: 'First name',
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: vm.validateFirstName,
                ),

                SizedBox(height: 14.h),

                // ── Last name ─────────────────────────────────────────────────
                CustomTextFieldWidget(
                  controller: vm.lastNameController,
                  hintText: 'Last name',
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: vm.validateLastName,
                ),

                SizedBox(height: 14.h),

                // ── Email ─────────────────────────────────────────────────────
                CustomTextFieldWidget(
                  controller: vm.emailController,
                  hintText: 'Email address',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: vm.validateEmail,
                ),

                SizedBox(height: 14.h),

                // ── Password ──────────────────────────────────────────────────
                CustomTextFieldWidget(
                  controller: vm.passwordController,
                  hintText: 'Password',
                  obscureText: vm.obscurePassword,
                  textInputAction: TextInputAction.next,
                  validator: vm.validatePassword,
                  suffixIcon: GestureDetector(
                    onTap: vm.togglePasswordVisibility,
                    child: Icon(
                      vm.obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: appColors.textHint,
                      size: 20.sp,
                    ),
                  ),
                ),

                SizedBox(height: 14.h),

                // ── Confirm password ──────────────────────────────────────────
                CustomTextFieldWidget(
                  controller: vm.confirmPasswordController,
                  hintText: 'Confirm password',
                  obscureText: vm.obscureConfirmPassword,
                  textInputAction: TextInputAction.done,
                  validator: vm.validateConfirmPassword,
                  suffixIcon: GestureDetector(
                    onTap: vm.toggleConfirmPasswordVisibility,
                    child: Icon(
                      vm.obscureConfirmPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: appColors.textHint,
                      size: 20.sp,
                    ),
                  ),
                ),

                SizedBox(height: 40.h),

                // ── Submit button ─────────────────────────────────────────────
                CustomButtonWidget(
                  text: 'Create account',
                  isLoading: vm.isLoading,
                  onPressed: () => vm.signUp(context),
                ),

                SizedBox(height: 24.h),

                // ── Login link ────────────────────────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: appColors.textSecondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).maybePop(),
                      child: Text(
                        'Log In',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: appColors.textPrimary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
