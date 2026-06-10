import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/feature/activities/view/activityScreen.dart';
import 'package:financial_app/feature/activities/widget/activityCard.dart';

import 'package:financial_app/feature/homePage/view/homePage.dart';
import 'package:financial_app/feature/homePage/viewModel/homePageViewModel.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homepageview extends StatelessWidget {
  homepageview({super.key});
  List<Widget> widgetBottomNavigationBar = [
    homePage(),

    Text('2'),
    activityScreen(),
    Text('4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<homePageViewModel>(
        builder: (context, value, child) =>
            widgetBottomNavigationBar[value.index],
      ),

      bottomNavigationBar: Consumer<homePageViewModel>(
        builder: (context, value, child) => BottomNavigationBar(
          selectedItemColor: appColors.secondary,
          useLegacyColorScheme: false,
          unselectedItemColor: appColors.textHint,
          showUnselectedLabels: true,
          currentIndex: value.index,
          onTap: (index) {
            if (index == 1)
              Navigator.of(context).pushNamed(NamePages.sendMoney);
            else if (index == 3)
              Navigator.of(context).pushNamed(NamePages.settingView);
            else
              value.goToScreen(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: 'Banking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payments_outlined),
              label: 'Pay',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
        ),
      ),
    );
  }
}
