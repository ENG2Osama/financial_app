import 'package:financial_app/core/constants/appSizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/appColors.dart';
import '../widget/customerCardNotifications.dart';

class notification extends StatelessWidget {
  const notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications',style: TextStyle(fontWeight: FontWeight.bold),),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_outlined),iconSize: 30,),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.settings_outlined),iconSize: 30,)
        ],
      ),backgroundColor: appColors.bgCard,
      body: Container(
        padding: EdgeInsets.all(appSizes.padding),
        child: customerCardNotifications(title: "Payment received",
          minAgo: "2",subTitle: "\$450 from Alex",),),
      

    )
      ;
  }
}
