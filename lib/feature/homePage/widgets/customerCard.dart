import 'package:financial_app/core/constants/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/appSizes.dart';

class customerViewCardHomePage extends StatelessWidget {
  final Icon iconCard;

  final String titleCard;

  final String subtitleCard;
VoidCallback OnTap;
   customerViewCardHomePage({super.key,required this.iconCard, 
    required this.titleCard,
    required this.OnTap
    ,required this.subtitleCard});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: OnTap,
      child: Card(



          child: Padding(    padding:  EdgeInsets.all(appSizes.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(backgroundColor: appColors.bgCard,
                    child: iconCard),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: Text('$titleCard',overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: appColors.secondary
                          ,fontWeight: FontWeight.bold
                    ),),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: Text('$subtitleCard',overflow: TextOverflow.ellipsis,
                    style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14
                  ),),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),

        ) ,
      ),
    );
  }
}
