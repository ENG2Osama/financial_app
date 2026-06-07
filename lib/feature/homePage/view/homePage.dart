import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/feature/auth/viewmodel/usesViewModel.dart';
import 'package:financial_app/feature/homePage/widgets/customerCard.dart';
import 'package:financial_app/route/namePages.dart';
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
              ,fontSize: 30.sp
        ),),
        actions: [Container(margin: EdgeInsets.all(10),
          child: CircleAvatar(
            
            backgroundColor: appColors.secondary,
            foregroundImage: AssetImage("assets/images/download.png"),
            child: IconButton(
              iconSize: 23,
              icon: Icon(Icons.person,)
                ,
              onPressed: (){
                Navigator.of(context).pushNamed(namePages.profileView);
          
              },
            ),
          ),
        )],
        leading: IconButton(iconSize: 30,
            onPressed: (){
          Navigator.of(context).pushNamed(namePages.settingView);

            }, icon: Icon(Icons.format_list_bulleted)),

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
                    copyWith(fontSize: 15),overflow: TextOverflow.ellipsis,),
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
                      color: appColors.onSecondary,
                      overflow: TextOverflow.ellipsis
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
                mainAxisExtent: 170

              ),
                children: [
                  customerViewCardHomePage(
                    iconCard: Icon(Icons.history,color: appColors.secondary,),
                    titleCard: 'Previous Activity',
                    subtitleCard: "View History",
                    OnTap: () {

                    }
                  )
              ,customerViewCardHomePage(iconCard: Icon(Icons.account_balance,color: appColors.secondary,),
                    titleCard: 'Link Bank',
                    subtitleCard: "Connect accounts",
                      OnTap: () {
                Navigator.of(context).pushNamed(namePages.lankBank).then((value){
                  if(value == true)
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Link Bank Successful',style:
                      Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: appColors.success
                      ),)));

                });

                      })
              ,    customerViewCardHomePage(iconCard: Icon(Icons.tune,color: appColors.secondary,),
                    titleCard: 'Spending Limits',

                    subtitleCard: "Manage controls",
                      OnTap: () {

                      }
                  ),
                  customerViewCardHomePage(iconCard: Icon(Icons.lock,color: appColors.secondary,),
                    titleCard: 'Security ',
                    subtitleCard: "App protection",
                      OnTap: () {

                      }
                  ),




                ],
              ),
            )

          ],
        ))
      ),

    );
  }
}
