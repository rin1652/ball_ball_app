import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var colorSchemeLight = const ColorScheme.light().copyWith(
  primary: Color(
    int.parse('0xff1CAD79'),
  ),
  onBackground: Colors.white,
);
final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: colorSchemeLight,
  cardTheme: const CardTheme().copyWith(
    color: colorSchemeLight.onBackground,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  textTheme: ThemeData().textTheme.copyWith(
        bodyLarge: GoogleFonts.inter(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: colorSchemeLight.primary,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: colorSchemeLight.onSecondary,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: colorSchemeLight.onSecondary,
        ),
        labelSmall: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: colorSchemeLight.onSecondary,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: colorSchemeLight.onSecondary,
        ),
        labelMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: colorSchemeLight.onSecondary,
        ),
      ),
);
