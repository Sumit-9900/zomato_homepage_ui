import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme {
    final baseTextTheme = ThemeData.dark().textTheme;

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      dividerColor: AppColors.divider,

      // 👇 Global Inter font
      fontFamily: GoogleFonts.inter().fontFamily,

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        hintStyle: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none, // no visible border
        ),
        prefixIconColor: AppColors.textSecondary,
        suffixIconColor: AppColors.textSecondary,
      ),

      tabBarTheme: TabBarThemeData(
        indicatorColor: AppColors.primary, // selected underline color
        labelColor: AppColors.primary,
        dividerColor: AppColors.divider,
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 4, color: AppColors.primary),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),

      // Text theme
      textTheme: baseTextTheme.copyWith(
        bodyLarge: const TextStyle(color: AppColors.textPrimary, fontSize: 16),
        bodyMedium: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
        ),
        bodySmall: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
        ),
        titleMedium: const TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        titleLarge: const TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        labelLarge: const TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),

      // AppBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      // Chips
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surface,
        labelStyle: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
        selectedColor: AppColors.primary,
        secondarySelectedColor: AppColors.accent,
        brightness: Brightness.dark,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.surface),
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),

      // Cards
      cardColor: AppColors.surface,

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),

      // Icons
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
    );
  }
}
