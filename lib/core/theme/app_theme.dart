import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // Core Brand Colors
  static const Color primaryLight = Color(0xFF4F46E5); // Indigo 600
  static const Color primaryDark = Color(0xFF6366F1);  // Indigo 500
  
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF090D16); // Premium deep dark
  
  static const Color surfaceLight = Color(0xFFF9FAFB);   // Gray 50
  static const Color surfaceDark = Color(0xFF111827);    // Gray 900
  
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1F2937);       // Gray 800

  static const Color textLight = Color(0xFF0F172A);      // Slate 900
  static const Color textDark = Color(0xFFF8FAFC);       // Slate 50
  
  static const Color textMutedLight = Color(0xFF64748B); // Slate 500
  static const Color textMutedDark = Color(0xFF94A3B8);  // Slate 400

  static const Color borderLight = Color(0xFFE2E8F0);    // Slate 200
  static const Color borderDark = Color(0xFF334155);     // Slate 700

  // Light Theme
  static ThemeData get lightTheme {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: primaryLight,
        secondary: Color(0xFF8B5CF6), // Violet 500
        surface: surfaceLight,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textLight,
        error: Color(0xFFEF4444),
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: backgroundLight,
      cardColor: cardLight,
      dividerColor: borderLight,
    );

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).copyWith(
        displayLarge: GoogleFonts.outfit(
          textStyle: base.textTheme.displayLarge,
          fontWeight: FontWeight.bold,
          color: textLight,
          height: 1.15,
        ),
        displayMedium: GoogleFonts.outfit(
          textStyle: base.textTheme.displayMedium,
          fontWeight: FontWeight.bold,
          color: textLight,
          height: 1.2,
        ),
        displaySmall: GoogleFonts.outfit(
          textStyle: base.textTheme.displaySmall,
          fontWeight: FontWeight.bold,
          color: textLight,
        ),
        headlineLarge: GoogleFonts.outfit(
          textStyle: base.textTheme.headlineLarge,
          fontWeight: FontWeight.w700,
          color: textLight,
        ),
        headlineMedium: GoogleFonts.outfit(
          textStyle: base.textTheme.headlineMedium,
          fontWeight: FontWeight.w600,
          color: textLight,
        ),
        headlineSmall: GoogleFonts.outfit(
          textStyle: base.textTheme.headlineSmall,
          fontWeight: FontWeight.w600,
          color: textLight,
        ),
        titleLarge: GoogleFonts.outfit(
          textStyle: base.textTheme.titleLarge,
          fontWeight: FontWeight.w600,
          color: textLight,
        ),
        titleMedium: GoogleFonts.outfit(
          textStyle: base.textTheme.titleMedium,
          fontWeight: FontWeight.w500,
          color: textLight,
        ),
        bodyLarge: GoogleFonts.inter(
          textStyle: base.textTheme.bodyLarge,
          color: textLight,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.inter(
          textStyle: base.textTheme.bodyMedium,
          color: textMutedLight,
          height: 1.5,
        ),
      ),
      cardTheme: CardTheme(
        color: cardLight,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: borderLight, width: 1),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: textLight),
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: primaryDark,
        secondary: Color(0xFFA78BFA), // Violet 400
        surface: surfaceDark,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textDark,
        error: Color(0xFFF87171),
        onError: Colors.black,
      ),
      scaffoldBackgroundColor: backgroundDark,
      cardColor: cardDark,
      dividerColor: borderDark,
    );

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).copyWith(
        displayLarge: GoogleFonts.outfit(
          textStyle: base.textTheme.displayLarge,
          fontWeight: FontWeight.bold,
          color: textDark,
          height: 1.15,
        ),
        displayMedium: GoogleFonts.outfit(
          textStyle: base.textTheme.displayMedium,
          fontWeight: FontWeight.bold,
          color: textDark,
          height: 1.2,
        ),
        displaySmall: GoogleFonts.outfit(
          textStyle: base.textTheme.displaySmall,
          fontWeight: FontWeight.bold,
          color: textDark,
        ),
        headlineLarge: GoogleFonts.outfit(
          textStyle: base.textTheme.headlineLarge,
          fontWeight: FontWeight.w700,
          color: textDark,
        ),
        headlineMedium: GoogleFonts.outfit(
          textStyle: base.textTheme.headlineMedium,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        headlineSmall: GoogleFonts.outfit(
          textStyle: base.textTheme.headlineSmall,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        titleLarge: GoogleFonts.outfit(
          textStyle: base.textTheme.titleLarge,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        titleMedium: GoogleFonts.outfit(
          textStyle: base.textTheme.titleMedium,
          fontWeight: FontWeight.w500,
          color: textDark,
        ),
        bodyLarge: GoogleFonts.inter(
          textStyle: base.textTheme.bodyLarge,
          color: textDark,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.inter(
          textStyle: base.textTheme.bodyMedium,
          color: textMutedDark,
          height: 1.5,
        ),
      ),
      cardTheme: CardTheme(
        color: cardDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: borderDark, width: 1),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: textDark),
      ),
    );
  }
}
