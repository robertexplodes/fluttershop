import 'package:flutter/material.dart';
import 'package:shop/domain/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> orders = [];

  void addOrder(Order order) {
    orders.add(order);
    notifyListeners();
  }
}