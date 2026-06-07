import 'package:financial_app/feature/Send_mony/model/sendModel.dart';
import 'package:financial_app/feature/Send_mony/model/sendMoneyRepo.dart';
import 'package:financial_app/feature/auth/viewmodel/usesViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sendmoneyprovider with ChangeNotifier {
  ////////////////////////////////////
  ///
  double balance = 0.0;
  //  this is variabl included in other feature
  ///
  //////////////////////////////////////

  static SendModel sendModel = SendModel();
  void loadBalance(BuildContext context) {
    balance = context.read<userViewModel>().BalanceGet;
  }

  

  void choicPerson(SendModel sendModelmodel, String controllerText) {
    sendModelmodel.reciverName = controllerText;
    sendModel = sendModelmodel;
    notifyListeners();
  }

  void determAmount(double controllerText) {
    sendModel.sendingAmount = controllerText;
    notifyListeners();
  }

  void sendDateFun(String currentDate) {
    sendModel.sendDate = currentDate;
    notifyListeners();
  }

  void sendTimefun(String currentTime) {
    sendModel.sendTime = currentTime;
    notifyListeners();
  }

  void addSendingOperation(SendModel sendModel) {
    sendModel.id++;
    Sendmoneyrepo.sendingOperationList.add(sendModel);
    length++;
    notifyListeners();
  }

  int length = Sendmoneyrepo.sendingOperationList.length;
}
