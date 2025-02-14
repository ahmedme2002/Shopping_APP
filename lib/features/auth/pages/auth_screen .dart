import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/core/custom_widgets/app_text_field/app_text_field.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';
import 'package:shopping_app/features/auth/manager/auth_provider.dart';
import 'package:shopping_app/features/nav/pages/main_home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRegistering = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    usernameController.text = "Ahmed2002";
    passwordController.text = "123456";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF6A11CB),
                  Color(0xFF2575FC)
                ], // Updated Colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/shopping-cart.svg",
                      height: 100,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      isRegistering ? "Create Account" : "Welcome Back",
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      isRegistering
                          ? "Register to track your orders easily."
                          : "Login to access your account.",
                      style: const TextStyle(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    AppTextField(
                      controller: usernameController,
                      hinttext: "Username",
                      prefixIcon: const Icon(Icons.person, color: Colors.grey),
                      enabledBorder: _customBorder(),
                      focusedBorder: _customBorder(),
                    ),
                    const SizedBox(height: 15),
                    AppTextField(
                      controller: passwordController,
                      hinttext: "Password",
                      obscure: !isPasswordVisible,
                      prefixIcon: const Icon(Icons.lock, color: AllColors.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AllColors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      ),
                      enabledBorder: _customBorder(),
                      focusedBorder: _customBorder(),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () async {
                        String username = usernameController.text.trim();
                        String password = passwordController.text.trim();

                        if (username.isEmpty || password.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Please enter username & password."),
                              backgroundColor: AllColors.redAccent,
                            ),
                          );
                          return;
                        }

                        if (isRegistering) {
                          await authProvider.registerUser(username, password);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const MainHomeScreen()));
                        } else {
                          bool success =
                              await authProvider.loginUser(username, password);
                          if (success) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const MainHomeScreen()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Invalid Credentials"),
                                backgroundColor: AllColors.redAccent,
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD700),
                        minimumSize: Size(size.width * 0.8, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(isRegistering ? "Sign Up" : "Login",
                          style: pp16b),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRegistering = !isRegistering;
                        });
                      },
                      child: Text(
                        isRegistering
                            ? "Already have an account? Login"
                            : "Don't have an account? Sign up",
                        style: const TextStyle(
                            color: AllColors.grayLight, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _customBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white54, width: 1.5),
      borderRadius: BorderRadius.circular(26),
    );
  }
}
