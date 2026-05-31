import 'package:financial_app/feature/homePage/view/homePageView.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';

class appRoute {
  static Map<String,WidgetBuilder> route = {
    namePages.homePage: (_) => homepageview()};
}
