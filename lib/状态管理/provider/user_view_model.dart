import 'package:flutter/material.dart';
import 'user_info.dart';

class UserViewModel extends ChangeNotifier {
  UserInfo _user;

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
    notifyListeners();
  }

  UserViewModel(this._user);
}
