import 'package:flutter/material.dart';

class FilterService extends ChangeNotifier{
  Map _userFilters = {};
  Map get userFilters => _userFilters;

  List _users = [];
  List get users => _users;


  void updateUsers(users) {
    _users = users != null ? users : {};
    notifyListeners();
  }

  void updateUserFilters(filters) {
    _userFilters = filters;
    print('update filters $filters');
    notifyListeners();
  }
}