import 'dart:math';

import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/constants/appSizes.dart';
import 'package:financial_app/core/theme/light/textThemeLight.dart';
import 'package:financial_app/core/widgets/ButtomPrimary.dart';
import 'package:financial_app/core/widgets/customTextFieldWidget.dart';
import 'package:financial_app/feature/Send_mony/model/sendModel.dart';
import 'package:financial_app/feature/Send_mony/model/sendMoneyRepo.dart';
import 'package:financial_app/feature/Send_mony/viewModel/sendMoneyProvider.dart';
import 'package:financial_app/feature/Send_mony/widgets/recentsCards.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Choicepersonview extends StatelessWidget {
  Choicepersonview({super.key});
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Textthemelight
      backgroundColor: appColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text("Send Money", style: Textthemelight.textTheme.bodyMedium),
        centerTitle: true,
        backgroundColor: appColors.background,
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Form(key: formKey,
            child: Container(padding: EdgeInsets.all(appSizes.padding),
              child: CustomTextFieldWidget(
                hintText: "Name, Account Number, @cachtag",
                keyboardType: TextInputType.text,
                suffixIcon: Icon(Icons.search),
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) return "The Field is required";
                  return null;
                },
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: appSizes.padding),
            child: Text("RECENTS", style: Textthemelight.textTheme.bodySmall),
          ),
          SizedBox(
            height: 300,
            child: Consumer<Sendmoneyprovider>(
              builder: (context, pro, child) {
                if (pro.length != 0) {
                  return ListView.builder(
                    itemCount: Sendmoneyrepo.sendingOperationList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Recentscards(
                        title: Sendmoneyrepo
                            .sendingOperationList[index]
                            .reciverName,
                        suptitle: "@arivera",
                      );
                    },
                  );
                } else {
                  return SizedBox(
                    height: 300,
                    child: Center(
                      child: Text(
                        "No Sending Opration Recently",
                        style: Textthemelight.textTheme.bodyMedium,
                      ),
                    ),
                  );
                }
              },
            ),
          ),

          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: appSizes.padding),
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
                          color: appColors.textFild,
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
                    if (formKey.currentState!.validate()) {
                      SendModel sendModel = SendModel();
                      provider.choicPerson(sendModel, nameController.text);

                      print(Sendmoneyprovider.sendModel.reciverName);
                      Navigator.pushNamed(
                        context,
                        namePages.determinetheamountview,
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
