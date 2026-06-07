import 'dart:math';

import 'package:financial_app/feature/auth/model/userModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userViewModel extends ChangeNotifier {
  UserModel? _userModel;

  void addUser(UserModel newUser) {
    UserModel.localUsers.add({
      "firstName": newUser.firstName,
      "lastName": newUser.lastName,
      "email": newUser.email,
      "password": newUser.password,
      "balance": newUser.Balance,
      "country": newUser.country,
      "phone": newUser.phone,
      "linkedBanks": newUser.linkedBanks,
    });
  }

  Future<bool> foundUser(String emailUser, String paswordUser) async {
    for (var element in UserModel.localUsers) {
      if (emailUser == element["email"] && paswordUser == element["password"]) {
        _userModel = UserModel(
          firstName: element["firstName"],
          lastName: element["lastName"],
          email: element["email"],
          password: element["password"],
          Balance: element["balance"],
          country: element["country"],
          phone: element["phone"],
          linkedBanks: element["linkedBanks"],
        );

        notifyListeners();
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool("isLogin", true);
        return true;
      }
    }
    return false;
  }

  get BalanceGet => _userModel?.Balance ?? 0.0;
  get firstName => _userModel?.firstName ?? " ";
  get lastName => _userModel?.lastName ?? " ";
  get phone => _userModel?.phone ?? " ";
  get country => _userModel?.country ?? " ";
  get email => _userModel?.email ?? " ";
  get linkedBanksGet => _userModel?.linkedBanks ?? [];
  set linkedBanksSet(Map<String, String> newLinkBak) {
    _userModel?.linkedBanks.add(newLinkBak);
    notifyListeners();
  }

  set BakanceSet(double newBakance) {
    _userModel?.Balance = newBakance;
    notifyListeners();
  }
}
