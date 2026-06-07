import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/appColors.dart';
import '../../../core/constants/appSizes.dart';

class customerCardViewBankLinked extends StatelessWidget {
  final String title;
  final String subtitle;
  const customerCardViewBankLinked({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return    Container(margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment(0, 0),
      padding: EdgeInsets.all(appSizes.padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromRGBO(242, 246, 225, 1)
      ),
      child:
      Row(
        children: [
          Container(padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: appColors.primary
            ),
            child: Icon(Icons.account_balance),

          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${title}',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: appColors.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),),
              Text('Account Number:${subtitle.substring(0,2)}****${subtitle.substring(6)}',style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 13

              ),),

            ],
          )
        ],
      ),);
  }
}
