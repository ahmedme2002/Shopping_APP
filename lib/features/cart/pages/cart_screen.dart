import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/custom_widgets/cart_items/cart_items.dart';
import 'package:shopping_app/features/cart/manager/cart_provider.dart';
import 'package:shopping_app/features/orders/manager/orders_provider.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';
import 'package:shopping_app/translations/local_keys.g.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _showOrderConfirmation(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final ordersProvider = Provider.of<OrdersProvider>(context, listen: false);

    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: LocaleKeys.Confirm_Order.tr(),
      desc: LocaleKeys.Are_you_sure.tr(),
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        ordersProvider.confirmOrder(List.from(cartProvider.shoppingCart));
        cartProvider.clearCart();

        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: LocaleKeys.Order_Placed.tr(),
          desc: LocaleKeys.successfully_Order.tr(),
          btnOkOnPress: () {},
        ).show();
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.my_Cart.tr(),
                style: pp18b,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: context.watch<CartProvider>().shoppingCart.isNotEmpty
                    ? _cartItemsList()
                    : _emptyCartMessage(size),
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              SizedBox(
                child: context.watch<CartProvider>().shoppingCart.isNotEmpty
                    ? _checkoutSection(size)
                    : const SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _checkoutSection(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.order_Info.tr(), style: pp16b),
        SizedBox(height: size.height * 0.010),
        _orderInfoRow(LocaleKeys.sub_Total.tr(),
            "\$ ${context.watch<CartProvider>().cartSubTotal}"),
        _orderInfoRow(LocaleKeys.delivery_charges.tr(),
            "\$ ${context.watch<CartProvider>().shippingCharge}"),
        _orderInfoRow(LocaleKeys.total.tr(),
            "\$ ${context.watch<CartProvider>().cartTotal}"),
        SizedBox(height: size.height * 0.030),
        SizedBox(
          width: double.infinity,
          height: size.height * 0.06,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AllColors.indigo,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            onPressed: () => _showOrderConfirmation(context),
            child: Text(
                "${LocaleKeys.check_out.tr()} (\$ ${context.watch<CartProvider>().cartTotal})",
                style: pp16w),
          ),
        ),
      ],
    );
  }

  Widget _orderInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: pp12b),
        Text(value, style: pp14b),
      ],
    );
  }
}

Widget _cartItemsList() {
  return Consumer<CartProvider>(
    builder: (context, value, child) {
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: value.shoppingCart
            .map((cartItems) => CartItems(cartModel: cartItems))
            .toList(),
      );
    },
  );
}

Widget _emptyCartMessage(Size size) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: size.height * 0.25),
        const Icon(Iconsax.bag, size: 50, color: AllColors.grey),
        SizedBox(height: size.height * 0.20),
        Text(LocaleKeys.cart_Empty.tr(),
            style: TextStyle(
                color: AllColors.grey,
                fontSize: font_18Size,
                fontWeight: FontWeight.w400)),
      ],
    ),
  );
}
