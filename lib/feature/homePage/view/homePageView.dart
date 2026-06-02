import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/feature/homePage/view/homePage.dart';
import 'package:financial_app/feature/homePage/viewModel/homePageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homepageview extends StatelessWidget {
   homepageview({super.key});
  List<Widget> widgetBottomNavigationBar=[

    homePage(),Text('2'),Text('3'),Text('4')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<homePageViewModel>(builder: (context, value, child) =>
        widgetBottomNavigationBar[value.index]
      ),

      bottomNavigationBar:

          Consumer<homePageViewModel>(
            builder: (context, value, child)
          =>BottomNavigationBar(
        selectedItemColor: appcolors.secondary,
        useLegacyColorScheme: false,
unselectedItemColor: appcolors.textHint,
showUnselectedLabels: true,
        currentIndex: value.index,
        onTap: (index){
          value.goToScreen(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Banking',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Card'),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments_outlined),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Activity',
          ),
        ],
      ),)
    );
  }
}
