import 'package:financial_app/core/constants/appColors.dart';
import 'package:financial_app/core/constants/appSizes.dart';
import 'package:financial_app/feature/Setting/widget/customerCardViewBankLinked.dart';
import 'package:financial_app/feature/auth/viewmodel/usesViewModel.dart';
import 'package:financial_app/route/namePages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../widget/customerViewInfoProfile.dart';

class profileView extends StatelessWidget {
  const profileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();

        }, icon: Icon(Icons.arrow_back_rounded),iconSize: 30,) ,
      ),

        body:
      Container(padding: EdgeInsets.all(appSizes.padding),
        width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  SizedBox(height: 10,),
                  Consumer<userViewModel>(
                    builder: (context, value, child) =>
                        Text('${value.firstName} ${value.lastName}',style: Theme.of(context).textTheme.bodyMedium,),

                  ),
                  SizedBox(height: 5,),
                  Text('Manage your digital identity',style: Theme.of(context).textTheme.bodySmall,),

                ],
              ),
            ),

        SizedBox(height: 40,),
        Consumer<userViewModel>(builder: (context, value, child)
        =>  customerViewInfroProfile(subTitel:"${value.firstName} ${value.lastName}" ,Titel: "NAME",
            IconsInfro: Icon(Icons.mode_edit_outline_outlined,color: appColors.textHint,)),)

            ,Selector<userViewModel,String>(
              builder: (context, value, child) => customerViewInfroProfile(Titel: "PHONE",
                subTitel: "${value}",IconsInfro: Icon(Icons.phone_enabled_outlined,color: appColors.textHint,),
              ),
              selector: (context, value) => value.phone,
            ),Selector<userViewModel,String>(
              builder: (context, value, child) => customerViewInfroProfile(Titel: "EMAIL",
                subTitel: "${value}",IconsInfro: Icon(Icons.email_outlined,color: appColors.textHint,),
              ),
              selector: (context, value) => value.email,
            ),
            Selector<userViewModel,String>(
              builder: (context, value, child) => customerViewInfroProfile(Titel: "COUNTRY",
                subTitel: "${value}",IconsInfro: Icon(Icons.location_on_outlined,color: appColors.textHint,),
              ),
              selector: (context, value) => value.country,

            ),

            Selector<userViewModel,double>(
              builder: (context, value, child) => customerViewInfroProfile(Titel: "BALANCE",
                subTitel: "${value}",IconsInfro: Icon(Icons.account_balance,color: appColors.textHint,),
              ),
              selector: (context, value) => value.Balance,

            ),
            SizedBox(height: 15,),

        Text("LINKED BANKS",style: Theme.of(context).textTheme.bodySmall,),
            SizedBox(height: 7,),
          Selector<userViewModel,List<Map>>(builder: (context, value, child) =>value.length==0?
              Text('There is NO',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 15.sp
              ),):
              ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: value.length,
            itemBuilder:(context, index)
            =>customerCardViewBankLinked(title: "${value[index]["bankName"]}", subtitle: "${value[index]["bankNumber"]}")
            ,

          ), selector: (context,vlaue)=>vlaue.linkedBanksGet)

,
        Divider(color: appColors.textHint,)


        ,    SizedBox(height: 20,),
            Center(
              child: 
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColors.error,
                  foregroundColor: appColors.primary,
                  minimumSize: Size(350.w, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
                  onPressed: (){
                  Navigator.of(context).popAndPushNamed(namePages.login);
              }, child: Text('Delete account',style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                color: appColors.onSecondary,
              ),)),
            )



          ]
        ),
      ),
    )
    );

  }
}
