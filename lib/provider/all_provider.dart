import 'package:flutter/material.dart';

class ProviderS with ChangeNotifier {
  List _homeserviseceList = [];
  List get homeserviseceList => _homeserviseceList;

  set homeserviseceList(List p) {
    _homeserviseceList = p;
    notifyListeners();
  }

  Duration _duration = Duration(seconds: 1);
  Duration _position = Duration(seconds: 1);

  Duration get position => _position;

  set position(Duration p) {
    _position = p;
    notifyListeners();
  }

  Duration get duration => _duration;

  set duration(Duration p) {
    _duration = p;
    notifyListeners();
  }

  int _selectedHours = 0;
  int _selectedMin = 0;
  int _isPm = 0;
  int _count = 2;
  int get count => _count;

  set count(int p) {
    _count = p;
    notifyListeners();
  }

  int get selectedHours => _selectedHours;

  set selectedHours(int p) {
    _selectedHours = p;
    notifyListeners();
  }

  int get selectedMin => _selectedMin;

  set selectedMin(int p) {
    _selectedMin = p;
    notifyListeners();
  }

  int get isPm => _isPm;

  set isPm(int p) {
    _isPm = p;
    notifyListeners();
  }
}

// task--------------------------------------------------
