import 'package:financial_app/feature/Send_mony/view/choicePersonView.dart';
import 'package:financial_app/feature/Send_mony/view/determineTheAmountView.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';

class Approute {
 static Map<String, Widget Function(BuildContext)> routesList = {
    Namepages.sendMoney: (context) => Choicepersonview(),
     Namepages.Determinetheamountview : (context) => Determinetheamountview(),
  };
}
