import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/auth/manager/auth_provider.dart';
import 'package:shopping_app/features/nav/pages/splash_screen.dart';
import 'package:shopping_app/features/nav/pages/main_home_screen.dart';
import 'package:shopping_app/features/orders/manager/orders_provider.dart';
import 'package:shopping_app/features/cart/manager/cart_provider.dart';
import 'package:shopping_app/features/home/manager/product_provider.dart';
import 'package:shopping_app/translations/codegen_loader.g.dart';
import 'core/utilities/configs/core_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final authProvider = AuthProvider();
  await authProvider.checkLoginStatus();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => OrdersProvider()),
        ChangeNotifierProvider(create: (context) => authProvider),
      ],
      child: EasyLocalization(
        path: 'assets/translations/',
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: themeLight,
          darkTheme: themeDark,
          themeMode: ThemeMode.light,
          home: Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return authProvider.isAuthenticated
                  ? const MainHomeScreen()
                  : const SplashScreen();
            },
          ),
        );
      },
    );
  }
}
