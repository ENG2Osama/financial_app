import 'package:financial_app/core/widgets/customTextFieldWidget.dart';
import 'package:financial_app/feature/homePage/viewModel/lankBankViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/appColors.dart';
import '../../../core/constants/appSizes.dart';

class lankBank extends StatelessWidget {
   lankBank({super.key});
lankBankViewModel _bankViewModel =lankBankViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(appSizes.padding),
        height: double.infinity,
        width: double.infinity,
        child: Card(elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appSizes.borderRadius)
          ),
          child: Padding(
            padding:  EdgeInsets.all(appSizes.padding),


            child: Stack(
              children: [
                Form(key: _bankViewModel.formKeyLinkBank,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Row(children: [
                      IconButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, icon: Icon(Icons.arrow_back_rounded),iconSize: 26,),
                      SizedBox(width: 5,),
                      Text('Link Bank',style: Theme.of(context).textTheme.bodyMedium,)
                    ],),
                      SizedBox(
                        height: 40,
                      )
                      ,
                      Text(textAlign: TextAlign.center,
                        "This account is used to add or withdraw money.your information is secure.",
                        style: Theme.of(context).textTheme.bodySmall,),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Bank Name",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: appColors.secondary,
                          fontSize: 16

                      ),),
                      SizedBox(height: 10,),
                      CustomTextFieldWidget(
                        controller:_bankViewModel.bankName ,hintText: "e.g. Chase Bank",
                        suffixIcon: Icon(Icons.account_balance,color: appColors.textHint,

                        ),
                        validator: _bankViewModel.validateBankName,

                      ),
                      SizedBox(height: 20,),
                      Text("Account Number",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: appColors.secondary,
                        fontSize: 16
                      ),),
                      SizedBox(height: 10,),
                      CustomTextFieldWidget(
                        controller:_bankViewModel.acoountNumber ,hintText: "Enter account number",
                        suffixIcon: Icon(Icons.numbers,color: appColors.textHint,),
                        keyboardType: TextInputType.number,

                        validator: _bankViewModel.validateaccountNumber,

                      )


                    ],
                  ),
                ),
                Positioned(
                  bottom: 15,
                    left: 0,
                    right: 0,

                    child: ElevatedButton(onPressed: (){
_bankViewModel.linkAccount(context);
}, child: Text("Link Account",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: appColors.secondary
                    ),)),
                    )
              ],
            ),
          ),

        ),
      ),
    )

      ;
  }
}
