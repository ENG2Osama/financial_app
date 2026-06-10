import 'package:financial_app/feature/Setting/view/settingView.dart';
import 'package:financial_app/feature/activities/view/activityScreen.dart';

import 'package:financial_app/feature/auth/view/loginPageView.dart';
import 'package:financial_app/feature/auth/view/signUpPageView.dart';
import 'package:financial_app/feature/homePage/view/homePageView.dart';
import 'package:financial_app/feature/onboarding/view/onboarding_view.dart';
import 'package:financial_app/feature/recive/error/view/errorView.dart';
import 'package:financial_app/feature/recive/receiveMoney/view/receiveMoneyView.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';

import '../feature/Setting/view/NotificationsView.dart';
import '../feature/Setting/view/ProfileView.dart';
import '../feature/homePage/view/lankBank.dart';

import 'package:financial_app/feature/Send_mony/view/choicePersonView.dart';
import 'package:financial_app/feature/Send_mony/view/determineTheAmountView.dart';
import 'package:financial_app/feature/Send_mony/view/sendingAgreeView.dart';
import 'package:financial_app/feature/Send_mony/view/sendingComplateView.dart';

class appRoute {
  static Map<String, WidgetBuilder> routes = {
    NamePages.homePage: (_) => homepageview(),

    NamePages.onboarding: (_) => OnboardingView(),
    NamePages.login: (_) => LoginPageView(),
    NamePages.signUp: (_) => SignUpPageView(),
    NamePages.notificationPage: (_) => notification(),
    NamePages.profileView: (_) => profileView(),
    NamePages.settingView: (_) => settingView(),
    NamePages.lankBank: (_) => lankBank(),
    NamePages.sendMoney: (context) => Choicepersonview(),
    NamePages.determinetheamountview: (context) => Determinetheamountview(),
    NamePages.sendingAgree: (context) => Sendingagreeview(),
    NamePages.sendingcomplateview: (context) => Sendingcomplateview(),
    NamePages.activity: (_) => const activityScreen(),
    NamePages.ReceiveMoneyView: (_) => ReceiveMoneyView(),
    NamePages.ErrorView: (_) => const ErrorView(),
  };
}
