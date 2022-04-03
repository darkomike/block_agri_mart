import 'package:flutter/widgets.dart';

class AppStateManager extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isDarkModeOn = false;

  get getIsLoggedIn => _isLoggedIn;
  get getIsDarkModeOn => _isDarkModeOn;

   setIsLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
    notifyListeners();
  }

   setIsDarkModeOn(bool isDarkModeOn) {
    _isDarkModeOn = isDarkModeOn;
    notifyListeners();
  }

  changeTheme(bool value) {
    setIsDarkModeOn(value);
  }
}

// A global variable managing the whole state
final    appStateManager = AppStateManager();
