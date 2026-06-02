import 'package:financial_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../viewmodel/loginViewModel.dart';
import '../widgets/customTextFieldWidget.dart';
import '../widgets/customButtonWidget.dart';
import 'signUpPageView.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const _LoginContent(),
    );
  }
}

class _LoginContent extends StatelessWidget {
  const _LoginContent();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();

    return Scaffold(
      backgroundColor: appColors.bgLight,
      body: SafeArea(
        child: Form(
          key: vm.formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56.h),

                // ── Title ─────────────────────────────────────────────────────
                Text(
                  'Welcome Back',
                  style: GoogleFonts.inter(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w800,
                    color: appColors.textPrimary,
                    letterSpacing: -0.5,
                  ),
                ),

                SizedBox(height: 8.h),

                Text(
                  'Sign in to continue',
                  style: GoogleFonts.inter(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: appColors.textSecondary,
                  ),
                ),

                SizedBox(height: 40.h),

                // ── Email label ───────────────────────────────────────────────
                Text(
                  'Email',
                  style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: appColors.textPrimary,
                  ),
                ),

                SizedBox(height: 8.h),

                // ── Email field ───────────────────────────────────────────────
                CustomTextFieldWidget(
                  controller: vm.emailController,
                  hintText: 'name@example.com',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: vm.validateEmail,
                ),

                SizedBox(height: 20.h),

                // ── Password label ────────────────────────────────────────────
                Text(
                  'Password',
                  style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: appColors.textPrimary,
                  ),
                ),

                SizedBox(height: 8.h),

                // ── Password field ────────────────────────────────────────────
                CustomTextFieldWidget(
                  controller: vm.passwordController,
                  hintText: '••••••••',
                  obscureText: vm.obscurePassword,
                  textInputAction: TextInputAction.done,
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

                // ── Forgot password ───────────────────────────────────────────
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 0,
                      ),
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: appColors.textPrimary,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8.h),

                // ── Login button ──────────────────────────────────────────────
                CustomButtonWidget(
                  text: 'Login',
                  isLoading: vm.isLoading,
                  onPressed: () =>
                      vm.login(context),
                ),

                SizedBox(height: 24.h),

                // ── Sign up link ──────────────────────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: appColors.textSecondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const SignUpPageView(),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: appColors.textPrimary,
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
