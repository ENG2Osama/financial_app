import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/feature/auth/viewmodel/usesViewModel.dart';
import 'package:financial_app/feature/homePage/widgets/customerCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/appSizes.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: appColors.background,
        elevation: 0.5
        ,shadowColor: appColors.secondary
        ,        title: Text('Home',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold
              ,fontSize: 32
        ),),
        actions: [Container(margin: EdgeInsets.all(10),
          child: CircleAvatar(
            
            backgroundColor: appColors.secondary,
            foregroundColor:appColors.onSecondary ,
            child: IconButton(
              iconSize: 23,
              icon: Icon(Icons.person,)
                ,
              onPressed: (){
          
              },
            ),
          ),
        )],
        leading: IconButton(iconSize: 27,
            onPressed: (){}, icon: Icon(Icons.format_list_bulleted)),

      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(appSizes.padding ),
            child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text('Welcome',style:Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: appColors.textHint,
              fontWeight: FontWeight.w500
            ))
            ,
            Selector<userViewModel,String>(builder: (context, value, child) =>
            Text('${value}',style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w700
            ))  , selector:(context, value) =>value.firstName ,
        )

,   SizedBox(
              height: 15.h,
            ),

           Container(height: 95.h,
                width: double.infinity,
                child: Card(
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(30.w)
),                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Available Balance',style:Theme.of(context).textTheme.bodySmall),
                      Selector<userViewModel,double>(builder: (context, value, child) =>
                          Text('\$$value',style:Theme.of(context).textTheme.bodyLarge)
                        , selector:(context, value){
                            print("home vm ${value.hashCode}");
                    print(value.Balance);
                            final vm = context.read<userViewModel>();
                            print("Home VM: ${vm.hashCode}");
                        return value.Balance;
                      }
                      )

                    ],
                  ),),
              ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: (){}, child: Row(

                  children: [
                    Icon(Icons.arrow_upward_sharp,size: 20,),

                    Text(" Send Money",style: Theme.of(context).textTheme.bodyMedium!.
                    copyWith(fontSize: 15),),
                  ],
                )),
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                 backgroundColor   : appColors.secondary,
                   foregroundColor   : appColors.onSecondary

                  ) ,
                    onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.arrow_upward_sharp,size: 20,),

                    Text(" Receive Money",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14,
                      color: appColors.onSecondary
                    ),),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
mainAxisSpacing: 10
                ,crossAxisSpacing: 10,
                  crossAxisCount: 2,
                mainAxisExtent: 125.h

              ),
                children: [
                  customerCard(iconCard: Icon(Icons.history,color: appColors.secondary,),
                    titleCard: 'Previous Activity',
                    subtitleCard: "View History",)
              ,customerCard(iconCard: Icon(Icons.account_balance,color: appColors.secondary,),
                    titleCard: 'Link Bank',
                    subtitleCard: "Connect accounts",)
              ,    customerCard(iconCard: Icon(Icons.tune,color: appColors.secondary,),
                    titleCard: 'Spending Limits',
                    subtitleCard: "Manage controls",),
                  customerCard(iconCard: Icon(Icons.lock,color: appColors.secondary,),
                    titleCard: 'Security ',
                    subtitleCard: "App protection",),




                ],
              ),
            )

          ],
        ))
      ),

    );
  }
}
