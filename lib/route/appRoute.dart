import 'package:financial_app/feature/auth/view/loginPageView.dart';
import 'package:financial_app/feature/auth/view/signUpPageView.dart';
import 'package:financial_app/feature/homePage/view/homePageView.dart';
import 'package:financial_app/feature/onboarding/view/onboarding_view.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';

class appRoute {
  static Map<String, WidgetBuilder> routes = {
    namePages.homePage: (_) => homepageview(),

    namePages.onboarding: (_) => OnboardingView(),
    namePages.login: (_) => LoginPageView(),
    namePages.signUp: (_) => SignUpPageView(),
  };
}
