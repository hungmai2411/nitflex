import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  List<String> vouchers = [];

  void addVoucher(String code) {
    vouchers.add(code);
    notifyListeners();
  }
}
