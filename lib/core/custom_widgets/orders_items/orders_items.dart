import 'package:flutter/material.dart';
import 'package:shopping_app/features/orders/model/order_model.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';
import 'package:shopping_app/features/orders/pages/orders_details/orders_details.dart';

class OrdersItems extends StatelessWidget {
  final OrderModel orderModel;
  const OrdersItems({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: orderModel.cartItems.map((cartItem) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.25,
                    height: size.height * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Image.asset(
                        cartItem.product.image,
                        height: 70,
                        width: 70,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.product.name,
                          style: pp12b,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Ordered on ${_formatDate(orderModel.orderDate)}",
                          style: TextStyle(
                            fontSize: font_14Size,
                            fontWeight: FontWeight.w500,
                            color: AllColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrdersDetailsScreen(
                            order: orderModel,
                            selectedCartItem: cartItem,
                          ),
                        ),
                      );
                    },
                    child:
                        const Icon(Icons.arrow_forward_ios_rounded, size: 25),
                  ),
                ],
              ),
              const Divider(thickness: 1, color: Colors.grey),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Helper Function to Format Date
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
}
