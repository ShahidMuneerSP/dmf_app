import 'package:dmf_app/components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class RosaryScreenController extends ChangeNotifier {
  int _currentCount = 0;
  int _defaultCount = 0;
  List<Color> smallCircleColors = List.filled(1000000, Colors.white);
  List<Color> bigCircleColors = List.filled(5, Colors.transparent);
  int currentBigCircleIndex = 0;

  List<Color> changeBigCircleColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];

  int get currentCount => _currentCount;
  int get defaultCount => _defaultCount;
  void incrementCount() {
    _currentCount++;
    if (_currentCount <= 53) {
      smallCircleColors[_currentCount] = AppTheme.lightBlue;
    } else if (_currentCount == 54) {
      for (int i = 1; i <= 54; i++) {
        smallCircleColors[i] = Colors.white;
      }
      _currentCount = 0;
    }
    // if (_currentCount % 11 == 0) {
    //   currentBigCircleIndex = (_currentCount ~/ 11);
    // }
    for (int i = 53; i <= 53; i += 53) {
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

      if (_currentCount % 55 == 0 && _defaultCount > 0) {
        _defaultCount--;
      }
      notifyListeners();
    }
  }

  void editCount() {
    _currentCount = 0;
    _defaultCount = 0;
    notifyListeners();
  }
}
