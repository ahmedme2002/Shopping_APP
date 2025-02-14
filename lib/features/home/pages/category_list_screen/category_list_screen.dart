import 'package:flutter/material.dart';
import 'package:shopping_app/core/custom_widgets/product_items/product_items.dart';
import 'package:shopping_app/features/home/model/product_model.dart';

class CategoryListScreen extends StatelessWidget {
  final String categoryTitle;
  final List<ProductModel> products;

  const CategoryListScreen({
    super.key,
    required this.categoryTitle,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductItems(product: products[index]);
          },
          separatorBuilder: (context, index) => const Divider(
            color: Colors.grey, // Light grey for a clean look
            thickness: 0.5,
            indent: 15,
            endIndent: 15,
          ),
        ),
      ),
    );
  }
}
