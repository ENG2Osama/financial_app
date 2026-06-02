import 'package:financial_app/route/appRoute.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';

enum LoginStatus { idle, loading, success, error }

class LoginViewModel extends ChangeNotifier {
  // ── Form key ──────────────────────────────────────────────────────────────────
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  // ── Toggle visibility ─────────────────────────────────────────────────────────
  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  // ── Validators ────────────────────────────────────────────────────────────────
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

  // ── Submit ────────────────────────────────────────────────────────────────────
  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    _status = LoginStatus.loading;
    _errorMessage = null;
    notifyListeners();

    // Simulate network call — replace with real API
    await Future.delayed(const Duration(seconds: 2));

    debugPrint('✅ Login: ${emailController.text.trim()}');

    _status = LoginStatus.success;
    notifyListeners();

    Navigator.of(context).pushReplacementNamed(namePages.homePage);
  }

  // ── Dispose ───────────────────────────────────────────────────────────────────
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
