import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/appColors.dart';
import '../../../core/constants/appSizes.dart';

class customerCardNotifications extends StatelessWidget {
  final String title;

  final String subTitle;

  final String minAgo;

  const customerCardNotifications({super.key,required this.title,
    required this.subTitle,required this.minAgo});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 100.h,
      width:      double.infinity,
      child: Card(
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(appSizes.borderRadius)
),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: appColors.primary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                bottomLeft:Radius.circular(15) ),
              ),

              width: 4.w,
              height: 71.h,
            ),
            Expanded(
              child: ListTile(contentPadding: EdgeInsets.only(bottom: 25),
                leading:
                Container(
                  height: 40.h,
                  width: 60.w,
                  child: CircleAvatar(
                      foregroundColor: appColors.secondary,
                      backgroundColor: appColors.bgLight,
                      child: Icon(Icons.payments,size: 30,)),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$title'
                      ,style: Theme.of(context).
                      textTheme.bodySmall!.copyWith(
                        fontSize: 16.sp
                            ,
                        color: appColors.secondary
                          ,
                        fontWeight: FontWeight.bold
                      ),),
                    Text('$subTitle'
                      ,style: Theme.of(context).
                      textTheme.bodySmall!.copyWith(
                            fontSize: 13.sp

                        ),),
                  ],
                ),
                trailing: Container(margin: EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('$minAgo min ago'
                        ,style: Theme.of(context).
                        textTheme.bodySmall!.copyWith(fontSize: 13.sp,
                        fontWeight: FontWeight.w700),),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 8.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                          color: appColors.primary
                              ,borderRadius: BorderRadius.circular(10)
                        ),
                      )

                    ],
                  ),
                ),

              ),
            )

          ],
        ),
      ),
    );
  }
}
