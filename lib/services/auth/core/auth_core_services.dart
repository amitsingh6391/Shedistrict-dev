import 'package:flutter/cupertino.dart';

class AutCoreServices extends ChangeNotifier {
  bool rulesBool = false;

  changeRulesBool(bool value) {
    rulesBool = value;
    notifyListeners();
  }
}
