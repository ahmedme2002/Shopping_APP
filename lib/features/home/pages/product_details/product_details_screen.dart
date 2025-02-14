import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/home/model/product_model.dart';
import 'package:shopping_app/features/cart/manager/cart_provider.dart';
import 'package:shopping_app/features/home/manager/product_provider.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Color selectedColor = AllColors.red;
  int selectedSize = 6;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                widget.product.isAvailable
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
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  widget.product.image,
                  height: size.height / 3,
                ),
              ),
              Text(
                "NEW ARRIVAL",
                style: TextStyle(
                  fontSize: font_14Size,
                  color: AllColors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: size.height * 0.0040,
              ),
              Text(
                widget.product.name,
                style: pp22b,
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      color: AllColors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Save 20%",
                        style: TextStyle(
                          color: AllColors.white,
                          fontSize: font_12Size,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AllColors.yellow,
                        size: 30,
                      ),
                      SizedBox(width: size.width * 0.0050),
                      Text(
                        "4.8",
                        style: pp16b,
                      ),
                      SizedBox(width: size.width * 0.020),
                      Text(
                        "(232) Reviews",
                        style: TextStyle(
                          fontSize: font_14Size,
                          color: AllColors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              Text(
                "Information",
                style: pp16b,
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              Text(
                widget.product.desc,
                style: TextStyle(
                  fontSize: font_14Size,
                  color: AllColors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Color:",
                    style: pp16b,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        child: ListView.builder(
                          itemCount: widget.product.colors!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Color color = widget.product.colors![index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColor = color;
                                });
                              },
                              child: Container(
                                width: 25,
                                height: 25,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color,
                                  border: Border.all(
                                      color: selectedColor == color
                                          ? AllColors.black
                                          : Colors.transparent,
                                      width: 2),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Size:",
                    style: pp16b,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        child: ListView.builder(
                          itemCount: widget.product.sizes!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            int size = widget.product.sizes![index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Container(
                                width: 25,
                                height: 25,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AllColors.grayLight,
                                  border: Border.all(
                                      color: selectedSize == size
                                          ? AllColors.black
                                          : Colors.transparent,
                                      width: 2),
                                ),
                                child: Center(
                                  child: Text(size.toString()),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.08,
        margin: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  " Price : ",
                  style: TextStyle(
                    fontSize: font_14Size,
                    color: AllColors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),
                Text(
                  "\$ ${widget.product.price}",
                  style: pp16b,
                )
              ],
            ),
            widget.product.isAvailable
                ? Container(
                    width: size.width / 2,
                    height: size.height * 0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AllColors.indigo,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        context.read<CartProvider>().addToCart(widget.product);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: AllColors.green,
                                content: Text(
                                  "Item add!",
                                  style: TextStyle(color: AllColors.white),
                                )));
                      },
                      child: Center(
                        child: Text(
                          "Add To cart",
                          style: pp16w,
                        ),
                      ),
                    ),
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
                      Text("Out Of Stack", style: pp12r)
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
