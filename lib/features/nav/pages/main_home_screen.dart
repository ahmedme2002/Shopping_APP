import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/cart/manager/cart_provider.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';
import 'package:shopping_app/features/Favorites/favorite_screen.dart';
import 'package:shopping_app/features/cart/pages/cart_screen.dart';
import 'package:shopping_app/features/home/pages/home_screen/home_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopping_app/features/orders/pages/orders_screen/orders_screen.dart';
import 'package:shopping_app/features/profile/profile_screen/profile_screen.dart';
import 'package:shopping_app/translations/local_keys.g.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  Size size = Size.zero;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showDialog("Location Error", "Please enable location services.");
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showDialog("Permission Denied", "Location permission is required.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showDialog(
          "Permission Denied", "Please enable location in app settings.");
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    debugPrint("User Location: ${position.latitude}, ${position.longitude}");
  }

  void _showDialog(String title, String message) {
    AwesomeDialog(
      context: context,
      dialogType: title == "Success" ? DialogType.success : DialogType.warning,
      animType: AnimType.scale,
      title: title,
      desc: message,
      btnOkOnPress: () {},
    ).show();
  }

  final List<Widget> _buildScreens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const OrdersScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens[currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            border:
                Border(top: BorderSide(color: AllColors.black, width: 0.5))),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            bottomNavigationBarTheme:
                Theme.of(context).bottomNavigationBarTheme,
          ),
          child: BottomNavigationBar(
            items: [
              getIcon(0, LocaleKeys.home.tr(), Iconsax.home_14),
              getIcon(1, LocaleKeys.favorite.tr(), Iconsax.heart),
              BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.only(bottom: size.height * 0.005),
                  margin: const EdgeInsets.only(bottom: 2),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 45,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: AllColors.black),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Icon(
                            Iconsax.bag,
                            color: AllColors.black,
                            size: font_22Size,
                          ),
                        ),
                      ),
                      Positioned(
                        top: -5,
                        right: -4,
                        child: context
                                .watch<CartProvider>()
                                .shoppingCart
                                .isNotEmpty
                            ? CircleAvatar(
                                backgroundColor: AllColors.orange,
                                radius: 10,
                                child: Text(
                                  context
                                      .watch<CartProvider>()
                                      .shoppingCart
                                      .length
                                      .toString(),
                                  style: cm10,
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                ),
                label: LocaleKeys.Cart.tr(),
              ),
              getIcon(
                  3, LocaleKeys.orders.tr(), CupertinoIcons.list_bullet_indent),
              getIcon(4, LocaleKeys.profile.tr(), Iconsax.profile_circle),
            ],
            currentIndex: currentIndex,
            onTap: (int tab) {
              setState(() {
                currentIndex = tab;
              });
            },
          ),
        ),
      ),
    );
  }

  getIcon(int i, String label, IconData icon) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.only(bottom: size.height * 0.001),
        child: Icon(icon),
      ),
      label: label,
    );
  }
}
