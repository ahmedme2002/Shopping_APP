import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/custom_widgets/app_text_field/app_text_field.dart';
import 'package:shopping_app/core/custom_widgets/category_header/category_header.dart';
import 'package:shopping_app/core/custom_widgets/product_items/product_items.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';
import 'package:shopping_app/features/auth/manager/auth_provider.dart';
import 'package:shopping_app/features/home/manager/product_provider.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/features/home/pages/category_list_screen/category_list_screen.dart';
import 'package:shopping_app/translations/local_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController productController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final authProvider = Provider.of<AuthProvider>(context);

    String username = authProvider.username ?? "Guest";

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => _showAddressBottomSheet(context),
                        child: Text("${LocaleKeys.hello.tr()}, $username",
                            style: pp18b),
                      ),
                      Text(
                        LocaleKeys.favorite_main.tr(),
                        style: pp16,
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: size.height * 0.040,
                    foregroundImage:
                        const AssetImage("assets/images/profile3.jpg"),
                  )
                ],
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
                height: size.height * 0.025,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/cover.jpg",
                  fit: BoxFit.cover,
                  height: size.height * 0.2,
                ),
              ),
              SizedBox(
                height: size.height * 0.030,
              ),
              Column(
                children: [
                  CategoryHeader(
                    onSeeAllPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CategoryListScreen(
                            categoryTitle: LocaleKeys.shirts.tr(),
                            products: Provider.of<ProductProvider>(context,
                                    listen: false)
                                .shirts,
                          ),
                        ),
                      );
                    },
                    title: LocaleKeys.shirts.tr(),
                    count:
                        " ${Provider.of<ProductProvider>(context).shirts.length}",
                  ),
                  SizedBox(
                    height: size.height * 0.030,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Consumer<ProductProvider>(
                      builder: (context, value, child) {
                        return Row(
                            children: value.shirts
                                .map(
                                    (product) => ProductItems(product: product))
                                .toList());
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.030,
              ),
              Column(
                children: [
                  CategoryHeader(
                    onSeeAllPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CategoryListScreen(
                            categoryTitle: LocaleKeys.shoes.tr(),
                            products: Provider.of<ProductProvider>(context,
                                    listen: false)
                                .shoes,
                          ),
                        ),
                      );
                    },
                    title: LocaleKeys.shoes.tr(),
                    count:
                        " ${Provider.of<ProductProvider>(context).shoes.length}",
                  ),
                  SizedBox(
                    height: size.height * 0.030,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Consumer<ProductProvider>(
                      builder: (context, value, child) {
                        return Row(
                            children: value.shoes
                                .map(
                                    (product) => ProductItems(product: product))
                                .toList());
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.030,
              ),
              Column(
                children: [
                  CategoryHeader(
                    onSeeAllPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CategoryListScreen(
                            categoryTitle: LocaleKeys.pants.tr(),
                            products: Provider.of<ProductProvider>(context,
                                    listen: false)
                                .pants,
                          ),
                        ),
                      );
                    },
                    title: LocaleKeys.pants.tr(),
                    count:
                        " ${Provider.of<ProductProvider>(context).pants.length}",
                  ),
                  SizedBox(
                    height: size.height * 0.030,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Consumer<ProductProvider>(
                      builder: (context, value, child) {
                        return Row(
                            children: value.pants
                                .map(
                                    (product) => ProductItems(product: product))
                                .toList());
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.030,
              ),
              Column(
                children: [
                  CategoryHeader(
                    onSeeAllPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CategoryListScreen(
                            categoryTitle: LocaleKeys.watchs.tr(),
                            products: Provider.of<ProductProvider>(context,
                                    listen: false)
                                .watchs,
                          ),
                        ),
                      );
                    },
                    title: LocaleKeys.watchs.tr(),
                    count:
                        " ${Provider.of<ProductProvider>(context).watchs.length}",
                  ),
                  SizedBox(
                    height: size.height * 0.030,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Consumer<ProductProvider>(
                      builder: (context, value, child) {
                        return Row(
                            children: value.watchs
                                .map(
                                    (product) => ProductItems(product: product))
                                .toList());
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _showAddressBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.work.tr(), style: pp16),
              const SizedBox(height: 8),
              Text(
                "Cairo, El Marg, 10 Emad Hamdy Street ",
                style: pp12,
              ),
              const Divider(),
              const SizedBox(height: 15),
              Text(LocaleKeys.main_Home.tr(), style: pp16),
              const SizedBox(height: 8),
              Text(
                "Cairo, El Marg, 10 Emad Hamdy Street ",
                style: pp12,
              ),
              const Divider(),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(LocaleKeys.choose_Address.tr(), style: pp16),
                  const Icon(Iconsax.location,
                      color: AllColors.indigo, size: 24),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
