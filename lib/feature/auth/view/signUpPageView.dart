import 'package:financial_app/feature/Setting/widget/customerBottomSheetHelp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/appColors.dart';
import '../viewmodel/signUpViewModel.dart';
import '../../../core/widgets/customTextFieldWidget.dart';
import '../widgets/customButtonWidget.dart';

class SignUpPageView extends StatelessWidget {
   SignUpPageView({super.key});
  customerBottomSheetHelp _customerBottomSheetHelp= customerBottomSheetHelp();
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SignUpViewModel>();

    return Scaffold(
      backgroundColor: appColors.bgWhite,
      appBar: AppBar(
        backgroundColor: appColors.bgWhite,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            decoration: const BoxDecoration(
              color: appColors.bgCard,
              shape: BoxShape.circle,
            ),
            child:  Icon(
              Icons.arrow_back_rounded,
              color: appColors.textPrimary,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: InkWell(
                onTap: (){
                  _customerBottomSheetHelp.showBottomSheetHepl(context);
                },
                child: Text(
                  'Help',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: appColors.textPrimary,
                  ),
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 32),

                // العنوان
                 Text(
                  'Create your\naccount',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    color: appColors.textPrimary,
                    height: 1.15,
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 40),

                CustomTextFieldWidget(
                  controller: vm.firstNameController,
                  hintText: 'First name',
                  keyboardType: TextInputType.name,
                  validator: vm.validateFirstName,
                ),

                const SizedBox(height: 14),

                CustomTextFieldWidget(
                  controller: vm.lastNameController,
                  hintText: 'Last name',
                  keyboardType: TextInputType.name,
                  validator: vm.validateLastName,
                ),

                const SizedBox(height: 14),

                CustomTextFieldWidget(
                  controller: vm.emailController,
                  hintText: 'Email address',
                  keyboardType: TextInputType.emailAddress,
                  validator: vm.validateEmail,
                ),

                const SizedBox(height: 14),

                CustomTextFieldWidget(
                  controller: vm.passwordController,
                  hintText: 'Password',
                  obscureText: vm.obscurePassword,
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

                const SizedBox(height: 14),

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
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                CustomButtonWidget(
                  text: 'Create account',
                  isLoading: vm.isLoading,
                  onPressed: () => vm.signUp(context),
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: appColors.textSecondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
vm.cleanTextEditingControler();
                        Navigator.of(context).pop();
                      },
                      child:  Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: appColors.textPrimary,
                          decoration: TextDecoration.underline,
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
