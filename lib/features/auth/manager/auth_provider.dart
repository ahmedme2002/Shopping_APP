import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/features/auth/pages/auth_screen%20.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _username;

  bool get isAuthenticated => _isAuthenticated;
  String? get username => _username;

  /// ✅ Register User (Save credentials)
  Future<void> registerUser(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("username", username);
    await prefs.setString("password", password);

    _username = username;
    _isAuthenticated = true;
    notifyListeners();
  }

  /// ✅ Login User (Validate credentials)
  Future<bool> loginUser(String username, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? storedUsername = prefs.getString("username");
    String? storedPassword = prefs.getString("password");

    if (storedUsername == username && storedPassword == password) {
      _username = username;
      _isAuthenticated = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  /// ✅ Check Login Status (Auto-login)
  Future<void> checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? storedUsername = prefs.getString("username");

    if (storedUsername != null) {
      _username = storedUsername;
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    notifyListeners();
  }

  /// ✅ Logout User (Clears Data & Redirects)
  Future<void> logoutUser(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // ✅ Clears all stored user data

    _isAuthenticated = false;
    _username = null;
    notifyListeners();

    // ✅ Navigate back to Login Screen after logout
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const AuthScreen()),
      (route) => false, // ✅ Clears navigation history
    );
  }
}
