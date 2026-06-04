import 'package:financial_app/core/constants/appSizes.dart';
import 'package:financial_app/feature/Setting/viewModel/mothedContactUs.dart';
import 'package:financial_app/feature/Setting/widget/suctomerViewHelp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/appColors.dart';

class customerBottomSheetHelp{
  mothedContactUs _mothedContactUs =mothedContactUs();
  void showBottomSheetHepl(BuildContext context){
    showModalBottomSheet(context: context, builder: (context) =>
        Container(padding: EdgeInsets.all(appSizes.padding),
          child: Column(
            children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Help & Support'),
                  IconButton(onPressed: (){
                    Navigator.pop(context);

                  }, icon: Icon(Icons.close))
                ],),

              SizedBox(height: 20,),
              Expanded(
                child: suctomerViewHelp(ContactUs: (){
                },
                  title: "FAQ",
                  subTitle: "Find Answers Quickly",iconViewHelp: Icon(Icons.help_outline_outlined),
                ),
              ),
              SizedBox(height: 15,),
              Expanded(
                child: suctomerViewHelp(
                  ContactUs: () {
                    _mothedContactUs.ContectEmail();
                  },
                  title: "Email Support",
                  subTitle: "Get a response within 24h",iconViewHelp: Icon(Icons.email_outlined),
                ),
              ),SizedBox(height: 15,),

              Expanded(
                child: suctomerViewHelp(ContactUs: () {
                  _mothedContactUs.ContectPhone();
                  print('ContectPhone');
                },
                  title: "Contact Us",
                  subTitle: "Call our support team",iconViewHelp: Icon(Icons.help_outline_outlined),
                ),
              ),
              SizedBox(height: 30,),
              Flexible(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 56),
                           backgroundColor: appColors.secondary
                      ,foregroundColor: appColors.onSecondary
                ),
                    onPressed: (){
                      _mothedContactUs.ContectWhatsapp();
                    },
                    child: Text("Start Chat")),
              )




            ],
          ),
        )
      ,);


  }
}
