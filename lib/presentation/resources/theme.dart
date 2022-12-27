import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  const AppTheme._();

  static bool isDarkMode(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }

  static bool isLightMode(BuildContext context) => !isDarkMode(context);

  static ThemeData get lightTheme {
    final ThemeData base = ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
        primary: ColorPalette.primaryColor,
        onPrimary: ColorPalette.onPrimaryColor,
        primaryContainer: ColorPalette.primaryContainerColor,
        secondary: ColorPalette.secondaryColor,
        onSecondary: Colors.white,
        background: ColorPalette.backgroundColor,
        onBackground: ColorPalette.onBackgroundColor,
        surface: ColorPalette.surfaceColor,
        onSurface: ColorPalette.onSurfaceColor,
      ),
      primaryColor: ColorPalette.primaryColor,
      scaffoldBackgroundColor: ColorPalette.backgroundColor,
      dividerColor: ColorPalette.borderColor,
      unselectedWidgetColor: ColorPalette.disabledColor,
      toggleableActiveColor: ColorPalette.secondaryColor,
      shadowColor: ColorPalette.borderColor,
      disabledColor: ColorPalette.disabledColor,
    );
    return _buildThemeData(base);
  }

  static ThemeData get darkTheme {
    final ThemeData base = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: ColorPalette.darkPrimaryColor,
        onPrimary: ColorPalette.onPrimaryColor,
        primaryContainer: ColorPalette.primaryContainerColor,
        secondary: ColorPalette.darkSecondaryColor,
        onSecondary: ColorPalette.onSecondaryColor,
        background: ColorPalette.darkBackgroundColor,
        onBackground: ColorPalette.onDarkBackgroundColor,
        surface: ColorPalette.surfaceColor,
        onSurface: ColorPalette.onSurfaceColor,
      ),
      primaryColor: ColorPalette.primaryColor,
      scaffoldBackgroundColor: ColorPalette.darkBackgroundColor,
      dividerColor: ColorPalette.borderColor,
      unselectedWidgetColor: ColorPalette.disabledColor,
      toggleableActiveColor: ColorPalette.secondaryColor,
    );
    return _buildThemeData(base);
  }

  static ThemeData _buildThemeData(ThemeData base) {
    return ThemeData(
      brightness: base.brightness,
      colorScheme: base.colorScheme,
      textTheme: _buildTextTheme(base),
      appBarTheme: _buildAppBarTheme(base),
      iconTheme: _buildIconThemeData(base),
      inputDecorationTheme: _buildInputDecorationTheme(base),
      textButtonTheme: _buildTextButtonThemeData(base),
      outlinedButtonTheme: _buildOutlinedButtonThemeData(base),
      elevatedButtonTheme: _buildElevatedButtonThemeData(base),
      bottomNavigationBarTheme: _buildBottomNavigationBarThemeData(base),
      checkboxTheme: _buildCheckboxTheme(base),
      primaryColor: base.primaryColor,
      disabledColor: base.disabledColor,
      scaffoldBackgroundColor: base.scaffoldBackgroundColor,
      dividerColor: base.dividerColor,
      unselectedWidgetColor: base.unselectedWidgetColor,
      toggleableActiveColor: base.toggleableActiveColor,
      shadowColor: base.shadowColor,
      chipTheme: _buildChipTheme(base),
    );
  }

  static ChipThemeData _buildChipTheme(ThemeData base) {
    return ChipThemeData(
      backgroundColor: base.colorScheme.background,
      disabledColor: base.disabledColor,
      selectedColor: base.colorScheme.secondary,
      secondarySelectedColor: base.colorScheme.secondary,
      labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      shape: StadiumBorder(side: BorderSide(color: base.colorScheme.secondary)),
      secondaryLabelStyle: TextStyle(
        color: base.colorScheme.onSecondary,
        fontWeight: FontWeight.w600,
      ),
      labelStyle: TextStyle(
        fontSize: 10,
        color: base.colorScheme.secondary,
        fontWeight: FontWeight.w600,
      ),
      brightness: base.brightness,
    );
  }

  static CheckboxThemeData _buildCheckboxTheme(ThemeData base) {
    return CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(base.colorScheme.surface),
      checkColor: MaterialStateProperty.all<Color>(base.colorScheme.secondary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: BorderSide(color: base.disabledColor),
    );
  }

  static AppBarTheme _buildAppBarTheme(ThemeData theme) {
    return AppBarTheme(
      color: theme.colorScheme.background,
      titleTextStyle: TextStyle(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: theme.iconTheme.copyWith(
        color: theme.colorScheme.secondary,
      ),
    );
  }

  static InputDecorationTheme _buildInputDecorationTheme(ThemeData theme) =>
      InputDecorationTheme(
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: theme.colorScheme.onSurface,
        ),
        iconColor: theme.colorScheme.primary,
        filled: true,
        fillColor: theme.colorScheme.surface,
        focusColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        errorStyle: TextStyle(color: theme.colorScheme.error),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
      );

  static TextButtonThemeData _buildTextButtonThemeData(ThemeData theme) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          shape: const StadiumBorder(),
        ),
      );

  static OutlinedButtonThemeData _buildOutlinedButtonThemeData(
          ThemeData theme) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          shape: const StadiumBorder(),
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return theme.colorScheme.primary.withOpacity(0.5);
              }
              return null; // Use the component's default.
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return theme.colorScheme.onSurface;
              }
              return theme.colorScheme.primary;
            },
          ),
        ),
      );

  static ElevatedButtonThemeData _buildElevatedButtonThemeData(
          ThemeData theme) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          elevation: 0,
          shape: const StadiumBorder(),
        ).copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return theme.colorScheme.primary.withOpacity(0.5);
              } else if (states.contains(MaterialState.disabled)) {
                return theme.disabledColor;
              }
              return null; // Use the component's default.
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return theme.colorScheme.onSurface;
              }
              return theme.colorScheme.background;
            },
          ),
        ),
      );

  static BottomNavigationBarThemeData _buildBottomNavigationBarThemeData(
          ThemeData theme) =>
      BottomNavigationBarThemeData(
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.onSurface,
        elevation: 10,
        backgroundColor: theme.colorScheme.background,
      );

  static IconThemeData _buildIconThemeData(ThemeData theme) =>
      theme.iconTheme.copyWith(
        color: theme.primaryColor,
      );

  static TextTheme _buildTextTheme(ThemeData base) {
    final lato = GoogleFonts.lato().copyWith(fontWeight: FontWeight.w600);
    return GoogleFonts.montserratTextTheme()
        .copyWith(
          subtitle1: base.textTheme.subtitle1?.merge(lato) ?? lato,
          subtitle2: base.textTheme.subtitle2?.merge(lato) ?? lato,
          caption: base.textTheme.caption?.merge(lato) ?? lato,
        )
        .apply(
          displayColor: base.colorScheme.onBackground,
          bodyColor: base.colorScheme.onBackground,
        );
  }
}
