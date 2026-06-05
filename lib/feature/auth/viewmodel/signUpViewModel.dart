import 'package:financial_app/feature/auth/viewmodel/usesViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/appColors.dart';
import '../model/userModel.dart';

enum SignUpStatus { idle, loading, success, error }

class SignUpViewModel extends ChangeNotifier {
  // ── Form key ─────────────────────────────────────────────────────────────────
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // ── Controllers ──────────────────────────────────────────────────────────────
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // ── State ─────────────────────────────────────────────────────────────────────
  SignUpStatus _status = SignUpStatus.idle;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String? _errorMessage;

  SignUpStatus get status => _status;
  bool get obscurePassword => _obscurePassword;
  bool get obscureConfirmPassword => _obscureConfirmPassword;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _status == SignUpStatus.loading;

  // ── Toggle visibility ─────────────────────────────────────────────────────────
  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _obscureConfirmPassword = !_obscureConfirmPassword;
    notifyListeners();
  }

  // ── Validators ────────────────────────────────────────────────────────────────
  String? validateFirstName(String? value) {
    if (value == null || value.trim().isEmpty) return 'First name is required';
    if (value.trim().length < 2) return 'Must be at least 2 characters';
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Last name is required';
    if (value.trim().length < 2) return 'Must be at least 2 characters';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) return 'Enter a valid email address';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Must be at least 8 characters';
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Must contain at least one number';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != passwordController.text) return 'Passwords do not match';
    return null;
  }

  // ── Submit ────────────────────────────────────────────────────────────────────
  Future<void> signUp(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;


    _status = SignUpStatus.loading;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    context.read<userViewModel>().addUser(
        UserModel(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text
        ,Balance: 0.0,
          phone: "There is NO",
          country: "There is NO",
          linkedBanks: [
          ]
    ));
//osa@gmail.com


    _status = SignUpStatus.success;
    notifyListeners();

   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account Created',style: Theme.of(context).textTheme.bodySmall!.copyWith(
     color: appColors.succe
   ),)));
   Navigator.of(context).pop();
  }

  // ── Dispose ───────────────────────────────────────────────────────────────────
  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
