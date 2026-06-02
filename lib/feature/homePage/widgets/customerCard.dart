import 'package:financial_app/core/constants/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/appSizes.dart';

class customerCard extends StatelessWidget {
  final Icon iconCard;

  final String titleCard;

  final String subtitleCard;

  const customerCard({super.key,required this.iconCard, required this.titleCard,required this.subtitleCard});

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Padding(
        padding:  EdgeInsets.all(appsizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(backgroundColor: appcolors.bgCard,
                child: iconCard),
            SizedBox(
              height: 10.h,
            ),
            Text('$titleCard',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: appcolors.secondary
                    ,fontWeight: FontWeight.bold
              ),),
            SizedBox(
              height: 2.h,
            ),
            Text('$subtitleCard',style:
            Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 15
            ),),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ) ,
    );
  }
}
