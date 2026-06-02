import 'package:financial_app/feature/homePage/model/homePageModel.dart';
import 'package:flutter/cupertino.dart';

class homePageViewModel extends ChangeNotifier {
  homePageModel indexScreen=homePageModel();

  void goToScreen(int index){
    indexScreen.index=index;
notifyListeners();
  }
  get index=>indexScreen.index;




  
}