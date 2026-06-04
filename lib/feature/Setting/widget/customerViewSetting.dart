import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/appColors.dart';
import '../../../core/constants/appSizes.dart';

class customerViewSettings extends StatelessWidget {
  final String title;
  final Icon iconItemSetting;
   VoidCallback actionDo;
   customerViewSettings({super.key,
    required this.title,
    required this.iconItemSetting,  required this.actionDo });

  @override
  Widget build(BuildContext context) {
    return  Container(alignment: Alignment(0, 0),
      height: 70,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12,offset: Offset(0, 0),blurRadius: 7,spreadRadius: 0),
        ],

        color: appColors.bgWhite,
        borderRadius: BorderRadius.circular(appSizes.borderRadius)
        ,

      ),
      child:ListTile(onTap:actionDo ,
        title:Text('$title',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,color: appColors.secondary,
          fontSize: 16.sp
        ),) ,
        leading:    CircleAvatar(backgroundColor: appColors.bgCard,
            child: iconItemSetting),
        trailing:Icon(Icons.arrow_forward_ios_rounded,color:
        appColors.textHint,size: 18,) ,
      )
      ,);
  }
}
