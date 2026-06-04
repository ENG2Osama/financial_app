import 'package:financial_app/core/theme/appTheme.dart';
import 'package:financial_app/provider/ListChangeProvider.dart';
import 'package:financial_app/route/appRoute.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: ListChangeProvider.ListProvider,
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,

        child: mainPage(),
      ),
    ),
  );
}

class mainPage extends StatelessWidget {
   mainPage({super.key});
 late  SharedPreferences sharedPreferences ;
   bool isLogin=false;
Future<void> intilSharePreferences() async {
  sharedPreferences = await SharedPreferences.getInstance();
  bool isLogin=bool.parse( sharedPreferences.get('isLogin').toString() ) ?? false;

}
  @override
  Widget build(BuildContext context) {
    intilSharePreferences();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: namePages.settingView,
      theme: appTheme.lightTheme,
      routes: appRoute.routes,
    );
  }
}
