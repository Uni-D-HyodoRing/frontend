import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = "John Doe";
  String get name => _name;

  void changeName(String name) {
    _name = name;
    notifyListeners();
  }
}