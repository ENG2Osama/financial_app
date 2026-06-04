import 'package:financial_app/core/constants/appSizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/appColors.dart';

class suctomerViewHelp extends StatelessWidget {
  final String title;
  final String subTitle;
  Icon iconViewHelp;
  final VoidCallback ContactUs;

   suctomerViewHelp({super.key,
    required this.title, 
     required this.subTitle,
     required this.iconViewHelp,
     required this.ContactUs
  }) ;
 

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap:(){
        ContactUs();
      },

      child: Container(alignment: Alignment(0, 0),
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(appSizes.borderRadius),
      border: Border.all(color: appColors.textHint,width: 1)      ),
        child: ListTile(
          title:Text('$title',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,color: appColors.secondary,
              fontSize: 15.sp
          ),) ,
          subtitle: Text('$subTitle',style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 12.sp
          ),),
          leading:    CircleAvatar(backgroundColor: appColors.bgCard,
              child: iconViewHelp),
          trailing:Icon(Icons.arrow_forward_ios_rounded,color:
          appColors.textHint,size: 18,) ,
        ),
      ),
    );
  }
}
