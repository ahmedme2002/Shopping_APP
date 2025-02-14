import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/home/model/product_model.dart';
import 'package:shopping_app/features/cart/manager/cart_provider.dart';
import 'package:shopping_app/features/home/manager/product_provider.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';
import 'package:shopping_app/features/home/pages/product_details/product_details_screen.dart';
import 'package:shopping_app/translations/local_keys.g.dart';

class ProductItems extends StatefulWidget {
  final ProductModel product;

  const ProductItems({super.key, required this.product});
  @override
  State<ProductItems> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final productProvider = Provider.of<ProductProvider>(context);

    return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: SizedBox(
          width: size.height * 0.20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AllColors.white54,
                      boxShadow: const [
                        BoxShadow(
                          color: AllColors.white60,
                          spreadRadius: 0.5,
                          offset: Offset(5, 5),
                        )
                      ],
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen(product: widget.product),
                          ));
                        },
                        child: Image.asset(
                          widget.product.image,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: widget.product.isAvailable
                        ? GestureDetector(
                            onTap: () {
                              productProvider.toggleFavorite(widget.product);
                            },
                            child: Icon(
                              widget.product.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: widget.product.isFavorite
                                  ? AllColors.red
                                  : AllColors.black,
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              Text(
                widget.product.name,
                style: pp12b,
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              SizedBox(
                child: widget.product.isAvailable
                    ? Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AllColors.green,
                            radius: 4,
                          ),
                          SizedBox(
                            width: size.height * 0.008,
                          ),
                          Text(LocaleKeys.available.tr(), style: pp12g),
                        ],
                      )
                    : Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AllColors.red,
                            radius: 4,
                          ),
                          SizedBox(
                            width: size.height * 0.008,
                          ),
                          Text(LocaleKeys.out_of_stack.tr(), style: pp12r)
                        ],
                      ),
              ),
              SizedBox(
                height: size.height * 0.005,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ ${widget.product.price}",
                    style: TextStyle(
                      color: AllColors.grey,
                      fontSize: font_14Size,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  widget.product.isAvailable
                      ? GestureDetector(
                          onTap: () {
                            context
                                .read<CartProvider>()
                                .addToCart(widget.product);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: AllColors.green,
                                content: Text(
                                  LocaleKeys.Item_add.tr(),
                                  style:
                                      const TextStyle(color: AllColors.white),
                                )));
                          },
                          child: CircleAvatar(
                            child: Icon(
                              CupertinoIcons.cart_fill_badge_plus,
                              size: size.height * 0.030,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              )
            ],
          ),
        ));
  }
}
