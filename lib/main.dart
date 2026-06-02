import 'package:financial_app/core/theme/appTheme.dart';
import 'package:financial_app/provider/ListChangeProvider.dart';
import 'package:financial_app/route/appRoute.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: ListChangeProvider.ListProvider,
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,

        child: homePage(),
      ),
    ),
  );
}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: namePages.homePage,
      theme: appTheme.lightTheme,
      routes: appRoute.routes,
    );
  }
}
