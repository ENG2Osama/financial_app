import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/appColors.dart';
import '../viewmodel/loginViewModel.dart';
import '../widgets/customTextFieldWidget.dart';
import '../widgets/customButtonWidget.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();

    return Scaffold(
      backgroundColor: appColors.bgLight,
      body: SafeArea(
        child: Form(
          key: vm.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 56),

                // العنوان
                 Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    color: appColors.textPrimary,
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 8),

                 Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: 15,
                    color: appColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 40),

                 Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: appColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 8),

                CustomTextFieldWidget(
                  controller: vm.emailController,
                  hintText: 'name@example.com',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: vm.validateEmail,
                ),

                const SizedBox(height: 20),

                 Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: appColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 8),

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
                    ),
                  ),
                ),

                // نسيت كلمة المرور
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child:  Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: appColors.textPrimary,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // زر تسجيل الدخول
                CustomButtonWidget(
                  text: 'Login',
                  isLoading: vm.isLoading,
                  onPressed: () => vm.login(context),
                ),

                const SizedBox(height: 24),

                // رابط إنشاء حساب
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 14,
                        color: appColors.textSecondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        namePages.signUp,
                      ),
                      child:  Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: appColors.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
