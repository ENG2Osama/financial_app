import 'package:financial_app/route/namePages.dart';
import 'package:flutter/material.dart';
import '../model/errorModel.dart';

class ErrorViewModel extends ChangeNotifier {
  final ErrorModel _errorData = ErrorModel(
    title: "Something went wrong",
    description:
        "We couldn't process your request. Please check your connection and try again.",
  );

  ErrorModel get errorData => _errorData;

  void retryAction(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Please try again later")));
    debugPrint("Retrying connection...");
  }

  void goBack(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.popAndPushNamed(context, namePages.homePage);
    }
  }
}
