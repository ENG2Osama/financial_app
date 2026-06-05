import 'dart:math';

import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/constants/appSizes.dart';
import 'package:financial_app/core/theme/light/textThemeLight.dart';
import 'package:financial_app/core/widgets/ButtomPrimary.dart';
import 'package:financial_app/core/widgets/textFieldCustomer.dart';
import 'package:financial_app/feature/Send_mony/viewModel/sendMoneyProvider.dart';
import 'package:financial_app/feature/Send_mony/widgets/recentsCards.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Choicepersonview extends StatelessWidget {
  Choicepersonview({super.key});
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Textthemelight
      backgroundColor: appcolors.background,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_rounded),
        title: Text(
          "Send Money",
          style: Textthemelight.textTheme.bodyMedium,
          // style: TextStyle(color: appcolors.primary),
        ),
        centerTitle: true,
        backgroundColor: appcolors.background,
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Textfieldcustomer(
            text: "Name, Account Number, @cachtag",
            isNumberKeyboard: false,
            isSearch: true,
            controller: nameController,
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Appsizes.padding),
            child: Text("RECENTS", style: Textthemelight.textTheme.bodySmall),
          ),
          SizedBox(
            height: 300,
            child: ListView(
              children: [
                Recentscards(title: "Alex Rivera", suptitle: "@arivera"),
                Recentscards(title: "Alex Rivera", suptitle: "@arivera"),
                Recentscards(title: "Alex Rivera", suptitle: "@arivera"),
                Recentscards(title: "Alex Rivera", suptitle: "@arivera"),
                Recentscards(title: "Alex Rivera", suptitle: "@arivera"),
                Recentscards(title: "Alex Rivera", suptitle: "@arivera"),
                Recentscards(title: "Alex Rivera", suptitle: "@arivera"),
                Recentscards(title: "Alex Rivera", suptitle: "@arivera"),
                Recentscards(title: "Alex Rivera", suptitle: "@arivera"),
                Recentscards(title: "Alex Rivera", suptitle: "@arivera"),
              ],
            ),
          ),

          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Appsizes.padding),
            child: Text("SUGGESTED", style: Textthemelight.textTheme.bodySmall),
          ),

          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: appcolors.textFild,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(Icons.person_2_rounded),
                      ),

                      Text("David", style: Textthemelight.textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Consumer<Sendmoneyprovider>(
            builder: (contaxt, provider, child) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: buttomprimary(
                  txt: "Continue",
                  fun: () {
                    if (nameController.text != "") {
                      provider.choicPerson(nameController.text);

                      print(Sendmoneyprovider.sendModel.reciverName);
                      Navigator.pushNamed(
                        context,
                        Namepages.determinetheamountview,
                      );
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
