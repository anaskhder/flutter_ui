import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  ThemeMode tm = ThemeMode.light;
  void changeThemeToDark() {
    tm = ThemeMode.dark;
    notifyListeners();
  }

  void changeThemeToLight() {
    tm = ThemeMode.light;
    notifyListeners();
  }

  bool swValue = false;
}
