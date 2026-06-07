import 'package:financial_app/core/constants/appSizes.dart';
import 'package:financial_app/feature/Setting/viewModel/notificationViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: Selector<notificationViewModel,List<Map>>(
          builder: (context, value, child) =>value.length==0?Center(child: Text("There is NO"),): ListView.builder(itemBuilder:(context, index) =>
          customerCardNotifications(title: "${value[index]["title"]}",
            time: value[index]["time"],subTitle: "${value[index]["subtitle"]}",),
              itemCount: value.length,
          ) ,
          selector: (BuildContext context, notificationViewModel value) =>value.notification,),
           )

      

    )
      ;
  }
}
