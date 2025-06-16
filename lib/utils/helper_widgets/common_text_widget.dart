import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextWidgets {
  // Method to create customizable text using GoogleFonts.roboto
  static Widget textRoboto({
    required String text,
    required double size,
    required Color color,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    int maxLines = 1,
    TextOverflow overflow = TextOverflow.ellipsis,
    double letterSpacing = 0.0,
  }) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
