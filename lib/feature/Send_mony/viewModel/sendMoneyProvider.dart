import 'dart:ffi';

import 'package:financial_app/feature/Send_mony/model/sendModel.dart';
import 'package:financial_app/feature/Send_mony/model/sendMoneyRepo.dart';
import 'package:flutter/material.dart';

class Sendmoneyprovider with ChangeNotifier {
  static SendModel sendModel = SendModel();
  double balance = 100.00;

  void choicPerson(String controllerText) {
    sendModel.reciverName = controllerText;
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
    notifyListeners();
  }
}
