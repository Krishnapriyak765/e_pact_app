import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF3B2077);
  static const Color borderColor = Color(0xFF3B2077);
  static const Color loginbutton = Color(0xFF1C0D60);
  static const Color inputFieldBg = Color(0xFFF6F6F6);
  static const Color grey = Color(0xFF656565);
  static const Color bgprofile = Color(0xFFE5DFDF);
  static const Color red = Colors.red;
  static const Color green = Colors.green;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color bgColor = Colors.white;
  static const Color blue = Color(0xFF407DC3);
  static const Color appbarColor = Color(0xFF140859);
  static const Color appbarbgColor = Color(0xFF540A78);
  static const Color background = Color(0xFFF4F9FB);
  static const Color contaninecolor = Color(0xFF0D005F);
  static const Color notitext = Color(0xFF2E073F);
  static const Color greytext = Color.fromARGB(46, 7, 63, 80);
  // dark blue (adjusted from image)

  static const Color contaninebgcolor = Color(0xFFB163DC);

  LinearGradient kPurpleLinearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF0D005F), // dark blue (adjusted from image)
      Color(0xFFB163DC),
    ],
    // colors: [Color(0xFF140859), Color(0xFF540A78)],
  );
}
