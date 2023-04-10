import 'package:flutter/material.dart';

class ChangeProvider extends ChangeNotifier{
  int _count = 0;
  int get count => _count;
  void countUpdate(){
    _count ++;
    notifyListeners();
  }

}