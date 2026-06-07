import 'package:financial_app/feature/Setting/model/notificationModel.dart';
import 'package:financial_app/feature/Setting/viewModel/notificationViewModel.dart';
import 'package:financial_app/feature/auth/viewmodel/usesViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/appColors.dart';

class lankBankViewModel extends ChangeNotifier{
  TextEditingController bankName=TextEditingController();
  TextEditingController acoountNumber=TextEditingController();
  final GlobalKey<FormState> formKeyLinkBank = GlobalKey<FormState>();

String? validateBankName(String? value){
  if (value == null || value.trim().isEmpty) return 'Bank name is required';
  if (value.trim().length < 2) return 'Must be at least 2 characters';
  return null;
}

String? validateaccountNumber(String? value){
    if (value == null || value.trim().isEmpty) return 'Account Number is required';
    if (value.trim().length !=9) return 'Must be 9 Number';
    return null;
  }



  void linkAccount(BuildContext context){
  if(!formKeyLinkBank.currentState!.validate()) return;
    context.read<userViewModel>().linkedBanksSet=
      {
        "bankName": "${bankName.text.trim()}",
        "bankNumber": "${acoountNumber.text.trim()}"

    };
    context.read<notificationViewModel>().addNotification(title: "Bank linking process",
        subtitle: "It was linked with a ${bankName.text.trim()}", timeProsses: DateTime.now());

    Navigator.of(context).pop(true);




  }







}