import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';
import '../utils/app_border_radius.dart';
import '../utils/app_padding.dart';
import '../utils/app_size.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: _lightColorScheme,
        primaryColor: AppColor.black,
        scaffoldBackgroundColor: AppColor.backgroundColor,
        fontFamily: AppConstants.fontFamily,
        brightness: Brightness.light,
        appBarTheme: _appBarTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        inputDecorationTheme: _inputDecorationTheme,
      );

  static InputDecorationTheme get _inputDecorationTheme {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(
        color: AppColor.extraGray,
        width: 1.0.w,
      ),
    );
    var errorOutlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(
        color: AppColor.errorColor,
        width: 1.0.w,
      ),
    );
    return InputDecorationTheme(
      border: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      errorBorder: errorOutlineInputBorder,
      focusedErrorBorder: errorOutlineInputBorder,
      hintStyle: AppTextStyles.hintTextStyle,
      contentPadding: AppPadding.textFormFild,
    );
  }

  static ColorScheme get _lightColorScheme => ColorScheme(
        brightness: Brightness.light,
        primary: AppColor.white,
        onPrimary: AppColor.white,
        secondary: AppColor.blue,
        onSecondary: AppColor.white,
        error: AppColor.errorColor,
        onError: AppColor.white,
        surface: AppColor.backgroundColor,
        onSurface: AppColor.black,
      );

  static AppBarTheme get _appBarTheme => AppBarTheme(
        backgroundColor: AppColor.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.black),
      );

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            double.infinity,
            AppSize.elvatedButtonHeight.h,
          ),
          backgroundColor: AppColor.blue,
          shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.smallBorderRadius,
          ),
        ),
      );
  static TextStyle textStyle(double size, FontWeight weight, Color color) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }
}
//TODO refactor
