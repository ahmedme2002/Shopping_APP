import 'package:flutter/material.dart';
import 'package:shopping_app/features/cart/model/cart_model.dart';
import 'package:shopping_app/features/orders/model/order_model.dart';

class OrdersProvider extends ChangeNotifier {
  final List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  void confirmOrder(List<CartModel> cartItems) {
    _orders.insert(
        0,
        OrderModel(
          cartItems: List.from(cartItems), // Ensure items are stored correctly
          orderDate: DateTime.now(),
          // Store current order time
        ));
    notifyListeners();
  }
}
