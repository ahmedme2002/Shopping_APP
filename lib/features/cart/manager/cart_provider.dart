import 'package:flutter/material.dart';
import 'package:shopping_app/features/cart/model/cart_model.dart';
import 'package:shopping_app/features/home/model/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> _shoppingCart = [];

  void addToCart(ProductModel product) {
    var isExist =
        _shoppingCart.where((element) => element.product.id == product.id);
    if (isExist.isEmpty) {
      _shoppingCart.add(CartModel(
        product: product,
        quantity: 1,
      ));
    } else {
      isExist.first.quantity += 1;
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _shoppingCart.removeWhere((element) => element.id == productId);
    notifyListeners();
  }

  void incrementQty(String productId) {
    CartModel item =
        _shoppingCart.where((element) => element.id == productId).first;
    item.quantity++;
    notifyListeners();
  }

  void decrimentQty(String productId) {
    CartModel item =
        _shoppingCart.where((element) => element.id == productId).first;

    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _shoppingCart.remove(item);
    }
    notifyListeners();
  }

  void clearCart() {
    _shoppingCart.clear();
    notifyListeners();
  }

  double get cartSubTotal => _shoppingCart.fold(
      0, (sum, item) => sum + (item.product.price * item.quantity));
  double get shippingCharge => _shoppingCart.isNotEmpty ? 50 : 0;
  double get cartTotal => cartSubTotal + shippingCharge;
  List<CartModel> get shoppingCart => _shoppingCart;
}
