import 'package:financial_app/core/constants/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class profileView extends StatelessWidget {
  const profileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      Container(width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_rounded)),
          Row(
mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000)
                    ,border: Border.all(color: appColors.secondary,width: 2,style:BorderStyle.solid)

              ),
                child: CircleAvatar(

                  foregroundImage: AssetImage('assets/images/download.png'),
                ),
              ),
            ],
          )

        ],
      ),)
    );

  }
}
