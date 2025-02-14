import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/custom_widgets/app_text_field/app_text_field.dart';
import 'package:shopping_app/features/home/model/product_model.dart';
import 'package:shopping_app/features/home/manager/product_provider.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';
import 'package:shopping_app/features/home/pages/product_details/product_details_screen.dart';
import 'package:shopping_app/translations/local_keys.g.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
  });
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    final List<ProductModel> allProduct = [
      ...productProvider.shirts,
      ...productProvider.shoes,
      ...productProvider.pants,
      ...productProvider.watchs,
    ];

    final List<ProductModel> favoriteProduct = allProduct
        .where(
          (product) => product.isFavorite,
        )
        .toList();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                LocaleKeys.favorites_Products.tr(),
                style: pp18b,
              ),
            ),
            SizedBox(
              height: size.height * 0.030,
            ),
            AppTextField(
              hinttext: LocaleKeys.search.tr(),
              // ignore: prefer_const_constructors
              prefixIcon: Icon(
                Icons.search,
                size: 30,
              ),
            ),
            SizedBox(
              height: size.height * 0.030,
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: favoriteProduct.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final product = favoriteProduct[index];
                return Container(
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
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              product: product,
                            ),
                          ));
                        },
                        child: Image.asset(
                          product.image,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.030,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          product.name,
                          style: pp12b,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ ${product.price}",
                            style: TextStyle(
                              color: AllColors.grey,
                              fontSize: font_14Size,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              productProvider.toggleFavorite(product);
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.07),
                              radius: 18,
                              child: const Icon(
                                CupertinoIcons.delete_solid,
                                color: AllColors.redAccent,
                                size: 18,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
