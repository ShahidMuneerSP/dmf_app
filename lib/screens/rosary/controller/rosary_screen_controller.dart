import 'package:dmf_app/components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class RosaryScreenController extends ChangeNotifier {
  int _currentCount = 0;
  int _defaultCount = 0;
  List<Color> smallCircleColors = List.filled(1000000, Colors.white);
  List<Color> bigCircleColors = List.filled(5, Colors.transparent);

  int get currentCount => _currentCount;
  int get defaultCount => _defaultCount;

  void incrementCount() {
    _currentCount++;

    if (_currentCount <= 58) {
      smallCircleColors[_currentCount] = AppTheme.lightBlue;
    } else if (_currentCount == 54) {
      for (int i = 1; i <= 53; i++) {
        smallCircleColors[i] = Colors.white;
      }

      _currentCount = 0;
    }

    for (int i = 58; i <= 58; i += 58) {
      if (_currentCount == i) {
        _defaultCount++;

        break;
      }
    }
    notifyListeners();
  }

  void decrementCount() {
    if (_currentCount > 0) {
      _currentCount--;
      smallCircleColors[_currentCount + 1] = Colors.white;
      // if (_currentCount % 55 == 0 && _defaultCount > 0) {
      //   _defaultCount--;
      // }
      notifyListeners();
    }
  }

  // void editCount() {
  //   _currentCount = 0;
  //   _defaultCount = 0;
  //   notifyListeners();
  // }
}
