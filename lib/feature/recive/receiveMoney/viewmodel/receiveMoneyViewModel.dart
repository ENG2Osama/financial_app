import 'package:flutter/material.dart';
import '../model/receiveMoneyModel.dart';

class ReceiveMoneyViewModel extends ChangeNotifier {
  double amountRequested = 0.0;
  String paymentLink = "https://walletpay.com/receive?user=123";
  bool isLoading = false;

  void updateAmount(double newAmount) {
    amountRequested = newAmount;
    paymentLink = "https://walletpay.com/receive?user=123&amount=$amountRequested";
    notifyListeners();
  }

  void shareLink() {
    print("Sharing payment link: $paymentLink");
  }

  void copyToClipboard() {
    print("Copied link to clipboard: $paymentLink");
  }
}