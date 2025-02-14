import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/cart/model/cart_model.dart';
import 'package:shopping_app/features/cart/manager/cart_provider.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';
import 'package:shopping_app/translations/local_keys.g.dart';

class CartItems extends StatefulWidget {
  final CartModel cartModel;
  const CartItems({super.key, required this.cartModel});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: size.width * 0.30,
            height: size.height * 0.13,
            decoration: BoxDecoration(
              color: AllColors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Image.asset(
                widget.cartModel.product.image,
                height: 70,
                width: 70,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cartModel.product.name,
                  style: pp12b,
                ),
                SizedBox(
                  height: size.height * 0.030,
                ),
                Text(
                  "\$ ${widget.cartModel.product.price}",
                  style: TextStyle(
                    color: AllColors.grey,
                    fontSize: font_14Size,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .read<CartProvider>()
                            .incrementQty(widget.cartModel.id);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: AllColors.black26)),
                        child: const Icon(
                          Icons.add,
                          color: AllColors.black,
                          size: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.030,
                    ),
                    Text(widget.cartModel.quantity.toString()),
                    SizedBox(
                      width: size.width * 0.030,
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<CartProvider>()
                            .decrimentQty(widget.cartModel.id);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: AllColors.black26)),
                        child: const Icon(
                          Icons.remove,
                          color: AllColors.black,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<CartProvider>().removeItem(widget.cartModel.id);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: AllColors.grayLight,
                  content: Text(
                    LocaleKeys.Item_Removed.tr(),
                    style: const TextStyle(color: AllColors.black),
                  )));
            },
            child: CircleAvatar(
              backgroundColor: Colors.redAccent.withOpacity(0.07),
              radius: 18,
              child: const Icon(
                CupertinoIcons.delete_solid,
                color: AllColors.redAccent,
                size: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
