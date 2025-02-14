import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/model/product_model.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductModel> _shirts = [
    ProductModel(
      name: "Black T-Shirt",
      price: 50,
      image: 'assets/images/black t-shirt.png',
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      sizes: [5, 6, 7, 8, 9],
      colors: [
        AllColors.redAccent,
        AllColors.greenAccent,
        AllColors.yellow,
        AllColors.indigo,
        AllColors.black,
      ],
      isAvailable: true,
    ),
    ProductModel(
      name: "Red T-Shirt",
      price: 60,
      image: "assets/images/red t-shirt.png",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      sizes: [5, 6, 7, 8, 9],
      colors: [
        AllColors.redAccent,
        AllColors.greenAccent,
        AllColors.yellow,
        AllColors.indigo,
        AllColors.black,
      ],
      isAvailable: false,
    ),
    ProductModel(
      name: "white-Hoodie",
      price: 250,
      image: 'assets/images/image4.jpg',
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      sizes: [5, 6, 7, 8, 9],
      colors: [
        AllColors.redAccent,
        AllColors.greenAccent,
        AllColors.yellow,
        AllColors.indigo,
        AllColors.black,
      ],
      isAvailable: true,
    ),
  ];

  final List<ProductModel> _pants = [
    ProductModel(
      name: "Blue Cotton Pant",
      price: 79,
      image: "assets/images/cotton pant 1.png",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      sizes: [5, 6, 7, 8, 9],
      colors: [
        AllColors.redAccent,
        AllColors.greenAccent,
        AllColors.yellow,
        AllColors.indigo,
        AllColors.black,
      ],
      isAvailable: false,
    ),
    ProductModel(
      name: "Brown Cotton Pant",
      price: 80,
      image: "assets/images/grey cotton pant 2.png",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      sizes: [5, 6, 7, 8, 9],
      colors: [
        AllColors.redAccent,
        AllColors.greenAccent,
        AllColors.yellow,
        AllColors.indigo,
        AllColors.black,
      ],
      isAvailable: true,
    )
  ];

  final List<ProductModel> _shoes = [
    ProductModel(
      name: "Green Nike Shoe",
      price: 120,
      image: "assets/images/shoe 1.png",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      sizes: [5, 6, 7, 8, 9],
      colors: [
        AllColors.redAccent,
        AllColors.greenAccent,
        AllColors.yellow,
        AllColors.indigo,
        AllColors.black,
      ],
      isAvailable: true,
    ),
    ProductModel(
      name: "Purple Nike Shoe",
      price: 200,
      image: "assets/images/shoe 2.png",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      sizes: [5, 6, 7, 8, 9],
      colors: [
        AllColors.redAccent,
        AllColors.greenAccent,
        AllColors.yellow,
        AllColors.indigo,
        AllColors.black,
      ],
      isAvailable: true,
    ),
    ProductModel(
      name: "Purple Nike Shoe",
      price: 200,
      image: "assets/images/shoe 2.png",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      sizes: [5, 6, 7, 8, 9],
      colors: [
        AllColors.redAccent,
        AllColors.greenAccent,
        AllColors.yellow,
        AllColors.indigo,
        AllColors.black,
      ],
      isAvailable: false,
    )
  ];

  final List<ProductModel> _watchs = [
    ProductModel(
      name: " classic Watch",
      price: 150,
      image: "assets/images/2.png",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      sizes: [5, 6, 7, 8, 9],
      colors: [
        AllColors.redAccent,
        AllColors.greenAccent,
        AllColors.yellow,
        AllColors.indigo,
        AllColors.black,
      ],
      isAvailable: true,
    ),
    ProductModel(
      name: "Smart watch",
      price: 250,
      image: "assets/images/7.png",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      sizes: [5, 6, 7, 8, 9],
      colors: [
        AllColors.redAccent,
        AllColors.greenAccent,
        AllColors.yellow,
        AllColors.indigo,
        AllColors.black,
      ],
      isAvailable: true,
    ),
  ];

  void toggleFavorite(ProductModel product) {
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }

  List<ProductModel> get shirts => _shirts;
  List<ProductModel> get pants => _pants;
  List<ProductModel> get shoes => _shoes;
  List<ProductModel> get watchs => _watchs;
}
