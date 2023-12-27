import 'dart:async';

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
  bool _isTap = false;
  bool get isTap => _isTap;

  set isTap(bool p) {
    _isTap = p;
    notifyListeners();
  }

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

  double _progressValue = 0.0;
  double get progressValue => _progressValue;

  set progressValue(double p) {
    _progressValue = p;
    notifyListeners();
  }

  int _status = 0;
  int get status => _status;

  set status(int p) {
    _status = p;
    notifyListeners();
  }

  int _themeIndex = 0;
  int get themeIndex => _themeIndex;

  set themeIndex(int p) {
    _themeIndex = p;
    notifyListeners();
  }

  String _imgName = '';
  String get imgName => _imgName;

  set imgName(String p) {
    _imgName = p;
    notifyListeners();
  }
}

// task--------------------------------------------------
