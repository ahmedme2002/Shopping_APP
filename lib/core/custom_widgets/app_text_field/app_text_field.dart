import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hinttext;
  Function(String)? onchanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;
  final bool readOnly;
  final bool obscure;

  AppTextField({
    super.key,
    this.controller,
    required this.hinttext,
    this.onchanged,
    this.prefixIcon,
    this.suffixIcon,
    this.hintStyle,
    this.contentPadding,
    this.enabledBorder,
    this.focusedBorder,
    this.readOnly = false,
    this.obscure = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      onChanged: widget.onchanged,
      controller: widget.controller,
      obscureText: widget.obscure,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        enabledBorder: widget.enabledBorder ?? // Use custom border if provided
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(26),
            ),
        hintText: widget.hinttext,
        hintStyle: widget.hintStyle ?? // Use the custom hint style if provided
            GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: font_16Size,
                color: AllColors.grey,
              ),
            ),
        contentPadding:
            widget.contentPadding ?? // Use custom padding if provided
                const EdgeInsets.all(16),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(26),
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
