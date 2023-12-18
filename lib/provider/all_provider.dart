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
}

// task--------------------------------------------------
