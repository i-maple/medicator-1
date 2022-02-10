import 'package:flutter/material.dart';
import 'package:medicine_tracker/methods/auth_methods.dart';

class AuthProviders with ChangeNotifier {
  bool _isLoggedIn = AuthMethods().checkLoggedIn;
  bool _isLoading = false;

  bool get isLoggedIn {
    return _isLoggedIn;
  }

  getLoggedIn() {
    _isLoggedIn = !_isLoggedIn;
    notifyListeners();
  }

  changeLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
    return _isLoading;
  }
}
