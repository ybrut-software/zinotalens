import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  int _isSelected = 0;

  int get getIsSelected => _isSelected;
  void setIsSelected(int index) {
    _isSelected = index;
    notifyListeners();
  }
}
