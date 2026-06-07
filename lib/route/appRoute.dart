import 'package:financial_app/feature/Setting/view/settingView.dart';
import 'package:financial_app/feature/auth/view/loginPageView.dart';
import 'package:financial_app/feature/auth/view/signUpPageView.dart';
import 'package:financial_app/feature/homePage/view/homePageView.dart';
import 'package:financial_app/feature/onboarding/view/onboarding_view.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';

import '../feature/Setting/view/NotificationsView.dart';
import '../feature/Setting/view/ProfileView.dart';
import '../feature/homePage/view/lankBank.dart';

import 'package:financial_app/feature/Send_mony/view/choicePersonView.dart';
import 'package:financial_app/feature/Send_mony/view/determineTheAmountView.dart';
import 'package:financial_app/feature/Send_mony/view/sendingAgreeView.dart';
import 'package:financial_app/feature/Send_mony/view/sendingComplateView.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';

class appRoute {
  static Map<String, WidgetBuilder> routes = {
    namePages.homePage: (_) => homepageview(),

    namePages.onboarding: (_) => OnboardingView(),
    namePages.login: (_) => LoginPageView(),
    namePages.signUp: (_) => SignUpPageView(),
    namePages.notificationPage: (_) => notification(),
    namePages.profileView: (_) => profileView(),
    namePages.settingView: (_) => settingView(),
    namePages.lankBank: (_) => lankBank(),
    namePages.sendMoney: (context) => Choicepersonview(),
    namePages.determinetheamountview: (context) => Determinetheamountview(),
    namePages.sendingAgree: (context) => Sendingagreeview(),
    namePages.sendingcomplateview: (context) => Sendingcomplateview(),
  };
}
