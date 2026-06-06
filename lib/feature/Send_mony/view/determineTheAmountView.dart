import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/theme/light/textThemeLight.dart';
import 'package:financial_app/core/widgets/ButtomPrimary.dart';
import 'package:financial_app/core/widgets/textFieldCustomer.dart';
import 'package:financial_app/feature/Send_mony/viewModel/sendMoneyProvider.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as System;
import 'package:provider/provider.dart';

class Determinetheamountview extends StatelessWidget {
  TextEditingController numberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
 double? amount ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pushNamed(context, Namepages.sendMoney);
          },
        ),
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
            ),
          ),

          Textfieldcustomer(
            text: 'Add The Amount...',
            isNumberKeyboard: true,
            isSearch: false,
            controller: numberController,
            formKey: formKey,
          ),
          SizedBox(height: 380),
          Consumer<Sendmoneyprovider>(
            builder: (contaxt, provider, child) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: buttomprimary(
                    txt: "Send Now",
                    fun: () {
                      if (formKey.currentState!.validate()) {
                        double? temp = double.tryParse(numberController.text);
                        if (provider.balance >= temp!) {
                          
                          provider.determAmount(temp);

                          TimeOfDay timeOfDay = System.TimeOfDay.now();
                          String stringTime = timeOfDay.toString().substring(
                            10,
                            15,
                          );
                          provider.sendTimefun(stringTime);

                          DateTime date = DateTime.now();
                          String stringDate = date.toString().substring(0, 10);
                          provider.sendDateFun(stringDate);

                          Navigator.pushNamed(context, Namepages.sendingAgree);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content:Text("Your Balance Not Enghuth", style: TextStyle(fontSize: Textthemelight.textTheme.bodySmall!.fontSize),) ,
                            backgroundColor: appcolors.error,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                            duration: Duration(seconds: 2),),
                            );
                        }
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
