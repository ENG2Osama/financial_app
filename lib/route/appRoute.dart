import 'package:financial_app/feature/Send_mony/view/choicePersonView.dart';
import 'package:financial_app/feature/Send_mony/view/determineTheAmountView.dart';
import 'package:financial_app/feature/Send_mony/view/sendingAgreeView.dart';
import 'package:financial_app/feature/Send_mony/view/sendingComplateView.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';

class Approute {
 static Map<String, Widget Function(BuildContext)> routesList = {
     Namepages.sendMoney: (context) => Choicepersonview(),
     Namepages.determinetheamountview : (context) => Determinetheamountview(),
     Namepages.sendingAgree : (context) => Sendingagreeview(),
     Namepages.sendingcomplateview : (context) => Sendingcomplateview(),
  };
}
