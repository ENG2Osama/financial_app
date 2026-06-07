import 'package:financial_app/feature/Setting/viewModel/notificationViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/appColors.dart';
import '../../../core/constants/appSizes.dart';

class customerCardNotifications extends StatelessWidget {
  final String title;

  final String subTitle;

  final DateTime time;
   String? timeAge;
   customerCardNotifications({super.key,required this.title,
    required this.subTitle,
    required this.time});



  @override
  Widget build(BuildContext context) {
timeAge= context.read<notificationViewModel>().foundTimeAge(time);
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
            Container(margin: EdgeInsets.only(left: 0),
              decoration: BoxDecoration(
                  color: appColors.primary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                bottomLeft:Radius.circular(5) ),
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
                        fontSize: 16
                            ,
                        color: appColors.secondary
                          ,
                        fontWeight: FontWeight.bold
                      ),),SizedBox(height: 5,),
                    Text('$subTitle'
                      ,style: Theme.of(context).
                      textTheme.bodySmall!.copyWith(
                            fontSize: 13

                        ),),
                  ],
                ),
                trailing: Container(margin: EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${timeAge} ago'
                        ,style: Theme.of(context).
                        textTheme.bodySmall!.copyWith(fontSize: 13,
                        fontWeight: FontWeight.w700),),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 12,
                        width: 12,
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
