import 'package:flutter/cupertino.dart';

class LoginServices extends ChangeNotifier {
  String _userEmail = "";
  String get userEmail => _userEmail;
  String _userPassword = "";
  String get userPassword => _userPassword;

  String _userOtp = "";
  String get userOtp => _userOtp;

  void chnageUserEmail(String name) {
    _userEmail = name;
    notifyListeners();
  }

  void changePassword(String password) {
    _userPassword = password;
    notifyListeners();
  }

  void changeOtp(String otp) {
    _userOtp = otp;
    notifyListeners();
  }
}
