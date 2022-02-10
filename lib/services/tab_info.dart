import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  int _tab = 0;
  int get tab => _tab;
  int _topTab = 0;
  int get topTapindex => _topTab;
  int _eventTap = 0;
  int get enventTabindex => _eventTap;

  void updateBottomTab(int index) {
    _tab = index;
    notifyListeners();
  }

  void updateTopTab(int index) {
    _topTab = index;
    notifyListeners();
  }

  void updateEventTab(int index) {
    _eventTap = index;

    notifyListeners();
  }
}
