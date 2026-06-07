import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/feature/auth/viewmodel/usesViewModel.dart';
import 'package:financial_app/route/appRoute.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum LoginStatus { idle, loading, success, error }

class LoginViewModel extends ChangeNotifier {
  // ── Form key ──────────────────────────────────────────────────────────────────
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  userViewModel _userViewModel=userViewModel();

  // ── Controllers ───────────────────────────────────────────────────────────────
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // ── State ─────────────────────────────────────────────────────────────────────
  LoginStatus _status = LoginStatus.idle;
  bool _obscurePassword = true;
  String? _errorMessage;

  LoginStatus get status => _status;
  bool get obscurePassword => _obscurePassword;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _status == LoginStatus.loading;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
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
    return null;
  }


  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    bool isfound=await context.read<userViewModel>().foundUser(emailController.text.trim(), passwordController.text.trim());
if(!isfound) {
  _status = LoginStatus.loading;
  _errorMessage = null;
  notifyListeners();

  await Future.delayed(const Duration(seconds: 2));
  _status = LoginStatus.success;
  notifyListeners();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Email or Password incorrect',style:Theme.of(context).textTheme.bodySmall!.
      copyWith(color: appColors.error),)));
  emailController.text="";
  passwordController.text="";
  return ;
}





    _status = LoginStatus.loading;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));


    _status = LoginStatus.success;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login Successful',style: 
        Theme.of(context).textTheme.bodySmall!.copyWith(
        color: appColors.success
    ),)));
    Navigator.of(context).pushReplacementNamed(namePages.homePage);
  }
  void cleanTextEditingControler(){

    emailController.text="";
    passwordController.text="";
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
