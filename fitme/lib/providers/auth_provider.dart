import 'package:flutter/material.dart';

import '../models/appUser.dart';

class AuthProvider with ChangeNotifier {
  AppUser _appUser;

  set setAppUser(AppUser appUser) {
    _appUser = appUser;

    notifyListeners();
  }

  get getAppUser {
    return _appUser;
  }

  void removeAppUser() {
    _appUser = null;

    notifyListeners();
  }
}
