import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/custom_widgets/app_text_field/app_text_field.dart';
import 'package:shopping_app/core/custom_widgets/orders_items/orders_items.dart';
import 'package:shopping_app/features/orders/manager/orders_provider.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';
import 'package:shopping_app/translations/local_keys.g.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  SizedBox(
                    width: size.width * 0.020,
                  ),
                  Text(
                    LocaleKeys.your_Orders.tr(),
                    style: pp18b,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AppTextField(
                hinttext: LocaleKeys.search.tr(),
                // ignore: prefer_const_constructors
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: context.watch<OrdersProvider>().orders.isNotEmpty
                    ? _orderersList()
                    : _emptyOrderMessage(size),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderersList() {
    return Consumer<OrdersProvider>(
      builder: (context, value, child) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: value.orders
              .map((ordersItems) => OrdersItems(orderModel: ordersItems))
              .toList(),
        );
      },
    );
  }

  Widget _emptyOrderMessage(Size size) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.25),
          const Icon(Iconsax.bag, size: 50, color: AllColors.grey),
          SizedBox(height: size.height * 0.20),
          Text(LocaleKeys.order_Empty.tr(),
              style: TextStyle(
                  color: AllColors.grey,
                  fontSize: font_18Size,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
