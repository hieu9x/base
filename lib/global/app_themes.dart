import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/size_extension.dart';

class AppThemes {
  // app font
  static final _appFont = GoogleFonts.inter();

  // app color
  static const Color primaryColor = Color(0xFFFAFAFA);
  static const Color backgroundColor = Color(0xFFFAFAFA);
  static const Color lightSink = Color(0xFFF9F9FC);
  static const Color btIconBg = Color.fromRGBO(116, 120, 141, 0.1);
  static const Color btIconTitle = Color(0xFF74788D);
  static const Color title = Color(0xFF0B0C21);
  static const Color subTitle = Color(0xFF949494);
  static const Color lineH = Color(0xFFE4E4E4);
  static const Color lineV = Color(0xFFE7E9F5);
  static const Color bgCard = Color(0xFFF5F5FD);
  static const Color pass = Color(0xFF1DC9B7);
  static const Color lateAllow = Color(0xFF009B90);
  static const Color late = Color(0xFFFFB822);
  static const Color checkout = Color(0xFF6C63FF);
  static const Color inactive = Color(0xFFA4A4A4);
  static const Color arrGo = Color(0xFFD4D5DC);
  static const Color timeSub = Color(0xFFB9BBC6);
  static const Color blueBt = Color(0xFF324861);
  static const Color taskBg = Color(0xFFF5F5F7);
  static const Color border = Color(0xFFEFEFEF);
  static const Color borderInputView = Color.fromRGBO(116, 120, 141, 0.2);
  static const Color bgModal = Color.fromRGBO(0, 0, 0, 0.2);

  static const Color appRed = Color(0xFFCC2228);

  // app gradient
  static const LinearGradient activeLinearGradient = LinearGradient(colors: [Color(0xFF2AC6FF), Color(0xFF2A97FF)]);
  static const RadialGradient activeRadialGradient = RadialGradient(
    colors: [Color(0xFF2AC6FF), Color(0xFF2A97FF)],
    center: Alignment(-0.5, -3), // near the top right
    radius: 3,
  );

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: _appFont.copyWith(fontSize: 36.0.size, color: title, fontWeight: FontWeight.w900),
    displayMedium: _appFont.copyWith(fontSize: 28.0.size, color: title, fontWeight: FontWeight.w900),
    displaySmall: _appFont.copyWith(fontSize: 20.0.size, color: title, fontWeight: FontWeight.w900),
    headlineLarge: _appFont.copyWith(fontSize: 20.0.size, color: title, fontWeight: FontWeight.w700),
    headlineMedium: _appFont.copyWith(fontSize: 18.0.size, color: title, fontWeight: FontWeight.w700),
    headlineSmall: _appFont.copyWith(fontSize: 16.0.size, color: title, fontWeight: FontWeight.w700),
    bodyLarge: _appFont.copyWith(fontSize: 15.0.size, color: btIconTitle, fontWeight: FontWeight.w700),
    bodyMedium: _appFont.copyWith(fontSize: 15.0.size, color: btIconTitle, fontWeight: FontWeight.w400),
    bodySmall: _appFont.copyWith(fontSize: 14.0.size, color: btIconTitle, fontWeight: FontWeight.w400),
    titleLarge: _appFont.copyWith(fontSize: 15.0.size, color: title, fontWeight: FontWeight.w700),
    titleMedium: _appFont.copyWith(fontSize: 15.0.size, color: title, fontWeight: FontWeight.w500),
    titleSmall: _appFont.copyWith(fontSize: 14.0.size, color: title, fontWeight: FontWeight.w400),
    labelLarge: _appFont.copyWith(fontSize: 16.0.size, color: title, fontWeight: FontWeight.w700),
    labelMedium: _appFont.copyWith(fontSize: 14.0.size, color: title, fontWeight: FontWeight.w400),
    labelSmall: _appFont.copyWith(fontSize: 12.0.size, color: title, fontWeight: FontWeight.w400),
  );

  static final ThemeData lightTheme = ThemeData(
      primaryColor: title,
      fontFamily: 'inter',
      textTheme: lightTextTheme,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: btIconTitle),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: title),
        backgroundColor: AppThemes.backgroundColor,
        titleTextStyle: lightTextTheme.headlineMedium,
        centerTitle: false,
        elevation: 0.3,
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: AppThemes.lightTextTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w800,
          fontSize: 13.size,
        ),
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: AppThemes.appRed, width: 2.0),
        ),
        labelPadding: EdgeInsets.zero,
        unselectedLabelStyle: AppThemes.lightTextTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 13.size,
        ),
        labelColor: AppThemes.appRed,
        unselectedLabelColor: title,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppThemes.blueBt,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(86.w, 48),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: btIconTitle,
          backgroundColor: AppThemes.blueBt,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: Size(86.w, 48),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            textStyle: lightTextTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700, fontSize: 16, color: title)),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        labelStyle: TextStyle(color: btIconTitle, fontWeight: FontWeight.w400, fontSize: 16),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)), borderSide: BorderSide(color: btIconTitle)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: appRed, width: 1.5),
        ),
        contentPadding: EdgeInsets.all(12),
        hintStyle: TextStyle(color: btIconTitle, fontWeight: FontWeight.w400, fontSize: 16),
        errorStyle: TextStyle(color: appRed, fontWeight: FontWeight.w700, fontSize: 15),
        suffixIconColor: Color(0xFFBDBDBD),
      ),
      iconTheme: const IconThemeData(color: btIconTitle, weight: 100),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppThemes.appRed,
        unselectedItemColor: AppThemes.inactive,
        selectedLabelStyle: AppThemes.lightTextTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500, fontSize: 11),
        unselectedLabelStyle: AppThemes.lightTextTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500, fontSize: 11),
        enableFeedback: true,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        mouseCursor: MaterialStateMouseCursor.textable,
        type: BottomNavigationBarType.fixed,
      ));

  // error text
  static const TextStyle inputErrorStyle = TextStyle(color: appRed, fontWeight: FontWeight.w700, fontSize: 15);
}
