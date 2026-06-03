import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/theme/light/textThemeLight.dart';
import 'package:financial_app/core/widgets/textFieldCustomer.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';

class Determinetheamountview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: appcolors.background,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_rounded),
         onPressed: () { 
          Navigator.pushNamed(context, Namepages.sendMoney);
          },),
        title: Text(
          "Send Money",
          style: Textthemelight.textTheme.bodyMedium,
          // style: TextStyle(color: appcolors.primary),
        ),
        centerTitle: true,
        backgroundColor: appcolors.background,
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: appcolors.textFild,
              ),
              
              height: 70,
              width: 70,
              child: Icon(Icons.person_outline_rounded),
            ),),

            Textfieldcustomer(text: 'Add The Amount...',)
        ],
      ),
    );
  }
}
