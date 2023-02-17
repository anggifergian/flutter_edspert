import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

CupertinoThemeData cupertinoLight = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: CupertinoColors.activeBlue,
  scaffoldBackgroundColor: const Color(0xFFF3F7F8),
  textTheme: CupertinoTextThemeData(
    textStyle: GoogleFonts.poppins(
      color: CupertinoColors.black,
    ),
  ),
);
