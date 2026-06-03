import 'dart:math';

import 'package:financial_app/feature/auth/model/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userViewModel extends ChangeNotifier{


UserModel? _userModel;

void allUser(UserModel newUser){


  UserModel.localUsers.add( {
    "firstName": newUser.firstName,
    "lastName":newUser.lastName,
    "email":newUser.email,
    "password":newUser.password,
    "balance":newUser.Balance
  });
}

  Future<bool> foundUser(String emailUser,String paswordUser) async {
  bool isFound=false;
  for (var element in UserModel.localUsers) {
    if (emailUser == element["email"] &&
        paswordUser == element["password"]) {

      _userModel = UserModel(
        firstName: element["firstName"],
        lastName: element["lastName"],
        email: element["email"],
        password: element["password"],
        Balance: element["balance"],
      );


      notifyListeners();
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.setBool("isLogin", true);
      return true;
    }
  }
  return false;



  }
get Balance=>_userModel?.Balance ?? 0.0;
get firstName=>_userModel?.firstName ?? " o";



}

