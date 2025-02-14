import 'package:shopping_app/features/cart/model/cart_model.dart';

import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class OrderModel {
  final String id;
  final List<CartModel> cartItems;

  final DateTime orderDate; // ✅ Add this field to track order time

  OrderModel({
    required this.cartItems,
    required this.orderDate, // ✅ Ensure this is included
  }) : id = uuid.v4();
}
