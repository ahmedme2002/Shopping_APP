import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shopping_app/core/utilities/configs/app_typography.dart';
import 'package:shopping_app/core/utilities/configs/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Edit Language", style: pp16b),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Language", style: pp16b),
              const SizedBox(height: 15),
              _buildLanguageOption("English", "en"),
              _buildLanguageOption("Arabic", "ar"),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    _showConfirmationDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AllColors.indigo,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Confirm",
                      style: pp16b.copyWith(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language, String code) {
    return GestureDetector(
      onTap: () {
        setState(() => _selectedLanguage = language);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                _selectedLanguage == language ? AllColors.indigo : Colors.grey,
            width: _selectedLanguage == language ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(language, style: pp16b),
            Icon(
              _selectedLanguage == language
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: _selectedLanguage == language
                  ? AllColors.indigo
                  : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: "Language Changed",
      desc: "App language has been changed to $_selectedLanguage.",
      btnOkText: "OK",
      btnOkColor: AllColors.indigo,
      btnOkOnPress: () async {
        Locale newLocale = _selectedLanguage == "English"
            ? const Locale("en")
            : const Locale("ar");

        await context.setLocale(newLocale);
      },
    ).show();
  }
}
