import 'dart:math';
import 'package:flutter/widgets.dart';
import '../../main.dart';

class AppStateManager extends ChangeNotifier {
  bool _loggedIn = prefs.getBool('loggedIn')!;
  bool _darkModeOn = false;
  String _categorySelectedIs = "All";
  String _userType = prefs.getString('userType')!;

  bool get loggedIn => _loggedIn;
  bool get darkModeOn => _darkModeOn;
  String get categorySelectedIs => _categorySelectedIs;
  String get userType => _userType;

  setIsLoggedIn(bool isLoggedIn) {
    prefs.setBool('loggedIn', isLoggedIn);
    _loggedIn = isLoggedIn;
    notifyListeners();
  }

  setIsDarkModeOn(bool isDarkModeOn) {
    _darkModeOn = isDarkModeOn;
    notifyListeners();
  }

  changeTheme(bool value) {
    setIsDarkModeOn(value);
  }

  changeCategorySelected(String value) {
    _categorySelectedIs = value;
    notifyListeners();
  }

  setUserType(String userType) {
    _userType = userType;
    notifyListeners();
  }
}

// A global variable managing the whole app state
final appStateManager = AppStateManager();
