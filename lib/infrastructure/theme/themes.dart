import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  textTheme: GoogleFonts.notoSansAdlamTextTheme(
    ThemeData.light().textTheme,
  ),
  useMaterial3: true,
  colorScheme:
      ColorScheme.fromSeed(seedColor: Colors.teal, brightness: Brightness.dark),
);
final darkTheme = ThemeData(
  textTheme: GoogleFonts.notoSansAdlamTextTheme(
    ThemeData.dark().textTheme,
  ),
  useMaterial3: true,
  colorScheme:
      ColorScheme.fromSeed(seedColor: Colors.teal, brightness: Brightness.dark),
);
