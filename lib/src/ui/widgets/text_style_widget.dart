import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final titleHomeAppBar = GoogleFonts.openSans(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static final textFormComponent = GoogleFonts.openSans(
    fontSize: 10,
    fontWeight: FontWeight.w800,
    color: Colors.grey,
  );

  static final textButtonDateHour = GoogleFonts.openSans(
    fontSize: 10,
    color: Colors.black,
  );

  static final trTitleAlert = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: Colors.green);

  static final dateFormatAlert =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  static final trTimeAlert =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey);

  static final titleDescriptionAlert = GoogleFonts.openSans(
      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black);

  static final trDescriptionAlert = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey);
}
