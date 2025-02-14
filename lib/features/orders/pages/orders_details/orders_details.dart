import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';
import 'package:shopping_app/features/cart/model/cart_model.dart';
import 'package:shopping_app/features/orders/model/order_model.dart';
import 'package:shopping_app/translations/local_keys.g.dart';

class OrdersDetailsScreen extends StatefulWidget {
  final OrderModel order;
  final CartModel selectedCartItem;

  const OrdersDetailsScreen({
    super.key,
    required this.order,
    required this.selectedCartItem,
  });

  @override
  State<OrdersDetailsScreen> createState() => _OrdersDetailsScreenState();
}

class _OrdersDetailsScreenState extends State<OrdersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.view_order_details.tr(), style: pp18b),
                SizedBox(height: size.height * 0.020),
                _orderSummary(),
                Text(LocaleKeys.shipment_Details.tr(), style: pp18b),
                SizedBox(height: size.height * 0.020),
                _shipmentDetails(size),
                SizedBox(height: size.height * 0.020),
                Text(LocaleKeys.payment_Information.tr(), style: pp18b),
                SizedBox(height: size.height * 0.020),
                _paymentInformation(size),
                Text(LocaleKeys.shipping_address.tr(), style: pp18b),
                SizedBox(height: size.height * 0.020),
                _shippingAddress(size),
                Text(LocaleKeys.order_Summary.tr(), style: pp18b),
                SizedBox(height: size.height * 0.020),
                _finalOrderBreakdown(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _orderSummary() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AllColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AllColors.grayLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow(
              LocaleKeys.Order_Date.tr(), _formatDate(widget.order.orderDate)),
          const SizedBox(height: 8),
          _infoRow(
            LocaleKeys.Order_Total.tr(),
            "\$${_calculateTotalPrice(widget.order).toStringAsFixed(2)} "
            "(${_calculateTotalItems(widget.order)} item${_calculateTotalItems(widget.order) > 1 ? 's' : ''})",
          ),
        ],
      ),
    );
  }

  Widget _shipmentDetails(Size size) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AllColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AllColors.grayLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.shipped.tr(), style: pp18b),
          SizedBox(height: size.height * 0.010),
          Text(
            _formatDate(widget.order.orderDate.add(const Duration(days: 3))),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AllColors.greenAccent,
            ),
          ),
          SizedBox(height: size.height * 0.010),
          Column(
            children: widget.order.cartItems.map((cartItem) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    cartItem.product.image,
                    height: 60,
                    width: 60,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: size.width * 0.020),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartItem.product.name, style: pp14b),
                        Text("Qty: ${cartItem.quantity}",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[700])),
                        Text("Sold By: A.H.Q Group",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[700])),
                      ],
                    ),
                  ),
                  Text("\$ ${cartItem.product.price.toStringAsFixed(2)}",
                      style: pp16b),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _paymentInformation(Size size) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AllColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AllColors.grayLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.payment_Method.tr(), style: pp14b),
          SizedBox(height: size.height * 0.010),
          Text("Cash on Delivery", style: pp14),
        ],
      ),
    );
  }

  Widget _shippingAddress(Size size) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AllColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AllColors.grayLight),
      ),
      child: Text("Cairo, Elmarg, Street 10", style: pp12),
    );
  }

  Widget _finalOrderBreakdown(Size size) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AllColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AllColors.grayLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow("${LocaleKeys.items.tr()}:",
              "\$${_calculateTotalPrice(widget.order) - _calculateShipping(widget.order)}"),
          SizedBox(height: size.height * 0.015),
          _infoRow("${LocaleKeys.delivery_charges.tr()}:",
              "\$${_calculateShipping(widget.order)}"),
          SizedBox(height: size.height * 0.015),
          _infoRow("${LocaleKeys.Order_Total.tr()}:",
              "\$${_calculateTotalPrice(widget.order)}"),
        ],
      ),
    );
  }

  double _calculateTotalPrice(OrderModel order) {
    double totalPrice = order.cartItems
        .fold(0, (sum, item) => sum + (item.product.price * item.quantity));
    return totalPrice + _calculateShipping(order);
  }

  double _calculateShipping(OrderModel order) {
    return order.cartItems.isNotEmpty ? 50.0 : 0.0;
  }

  int _calculateTotalItems(OrderModel order) {
    return order.cartItems.fold(0, (sum, item) => sum + item.quantity);
  }

  String _formatDate(DateTime date) {
    return "${date.day} ${_monthName(date.month)} ${date.year}";
  }

  String _monthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[month - 1];
  }

  Widget _infoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title, style: pp14), Text(value, style: pp14b)],
    );
  }
}
