import 'dart:math';

import 'package:financial_app/feature/auth/model/userModel.dart';
import 'package:flutter/cupertino.dart';

class userViewModel extends ChangeNotifier{


UserModel? _userModel;


  bool foundUser(String emailUser,String paswordUser){
  bool isFound=false;
  for (var element in UserModel.localUsers) {
    if (emailUser == element["email"] &&
        paswordUser == element["password"]) {

      _userModel = UserModel(
        firstName: element["firstName"],
        lastName: element["lastName"],
        email: element["email"],
        password: element["password"],
        Balance: double.parse(element["balance"].toString()),
      );
      print("foundUser VM: ${hashCode}");
print("user vm ${this.hashCode}");
      notifyListeners();
      return true;
    }
  }
  return false;



  }
get Balance=>_userModel?.Balance ?? 0.0;
get firstName=>_userModel?.firstName ?? " o";



}

