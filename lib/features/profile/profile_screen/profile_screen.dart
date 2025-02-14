import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';
import 'package:shopping_app/features/Favorites/favorite_screen.dart';
import 'package:shopping_app/features/auth/manager/auth_provider.dart';

import 'package:shopping_app/features/orders/pages/orders_screen/orders_screen.dart';
import 'package:shopping_app/features/profile/language_screen/language_screen.dart';
import 'package:shopping_app/translations/local_keys.g.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.profile.tr(),
              style: pp18b,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: size.height * 0.050,
                foregroundImage: const AssetImage("assets/images/profile3.jpg"),
              ),
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            Expanded(
              child: ListView(
                children: [
                  buildMenuItem(
                    imagePath: "assets/images/ic_setting.svg",
                    title: LocaleKeys.account_Settings.tr(),
                    trailing: Icons.arrow_forward_ios_outlined,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  buildMenuItem(
                    imagePath: "assets/images/location-icon.svg",
                    title: LocaleKeys.delivery_Addresses.tr(),
                    trailing: Icons.arrow_forward_ios_outlined,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  buildMenuItem(
                    imagePath: "assets/images/fi-rr-time-forward.svg",
                    title: LocaleKeys.your_Orders.tr(),
                    trailing: Icons.arrow_forward_ios_outlined,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OrdersScreen(),
                    )),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  buildMenuItem(
                    imagePath: "assets/images/ic_language.svg",
                    title: LocaleKeys.language.tr(),
                    trailing: Icons.arrow_forward_ios_outlined,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LanguageScreen(),
                    )),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  buildMenuItem(
                    imagePath: "assets/images/favorite.svg",
                    title: LocaleKeys.favorite.tr(),
                    trailing: Icons.arrow_forward_ios_outlined,
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FavoriteScreen(),
                    )),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  buildMenuItem(
                    imagePath: "assets/images/ic_logout_forward.svg",
                    title: LocaleKeys.log_Out.tr(),
                    trailing: Icons.arrow_forward_ios_outlined,
                    onTap: () {
                      context.read<AuthProvider>().logoutUser(context);
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget buildMenuItem({
    required String imagePath,
    required String title,
    required IconData trailing,
    required VoidCallback onTap,
    Color color = AllColors.black,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: font_10Size),
      color: AllColors.white,
      child: ListTile(
        leading: SvgPicture.asset(
          imagePath,
          width: 24,
          height: 24,
        ),
        title: Text(title, style: pp14),
        trailing: Icon(trailing),
        onTap: onTap,
      ),
    );
  }
}
