import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/appColors.dart';

class customerViewInfro extends StatelessWidget {
  final String subTitel;
  final String Titel;
  final Icon IconsInfro;
  const customerViewInfro({super.key,
    required this.subTitel,
    required this.Titel,
    required this.IconsInfro});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [


      Container(child:
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$Titel",style: Theme.of(context).textTheme.bodySmall,),
            Text("$subTitel",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 15.sp
            ),),
          ],
        ),
       IconsInfro

      ],
    ),),
    Divider(color: appColors.textHint,),
    SizedBox(height: 20,)
      ],
    );
  }
}
