import 'package:aloplay_simulation/core/coantants/app_colors.dart';
import 'package:aloplay_simulation/core/cubit/locale_cubit.dart';
import 'package:aloplay_simulation/core/utils/devise_size.dart';
import 'package:aloplay_simulation/locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDef {
  AppDef._();

  static const double defaultTabletSize = 780;

  static double defaultAppSize = 580;

  static bool isDefaultAppSize(BuildContext context) {
    return DevSize.getWidth(context) <= defaultAppSize;
  }

  static bool isTabletSize(BuildContext context) {
    return DevSize.getWidth(context) <= defaultTabletSize;
  }

  static double defaultDesktopBodyMargin(BuildContext context) {
    return DevSize.getWidth(context) / 21.3;
  }

  static double defaultMobileBodyMargin = 16;

  static double defaultBodyMargin(BuildContext context) {
    return isDefaultAppSize(context)
        ? defaultMobileBodyMargin
        : defaultDesktopBodyMargin(context);
  }

  /// Dialog content padding
  static EdgeInsetsGeometry dialogContentPadding(BuildContext context) {
    return EdgeInsets.all(AppDef.isDefaultAppSize(context) ? 12 : 24);
  }

  /// Dialog action padding
  static EdgeInsetsGeometry dialogActionPadding(BuildContext context) {
    return EdgeInsets.only(
      left: AppDef.isDefaultAppSize(context) ? 12 : 24,
      right: AppDef.isDefaultAppSize(context) ? 12 : 24,
      bottom: AppDef.isDefaultAppSize(context) ? 12 : 24,
      top: 8,
    );
  }

  // default  buttons size of bottom sheet
  static Size defaultSheetSize(BuildContext context) {
    return Size(DevSize.getWidth(context) / 2.6, 48);
  }

  // default elevated button size
  static Size defaultButtonSize(BuildContext context) {
    return Size(DevSize.getWidth(context), DevSize.getHeight(context) / 18);
  }

  // default container box shadow
  static List<BoxShadow>? defaultBoxShadow = [
    const BoxShadow(
      spreadRadius: 2,
      blurRadius: 5,
      color: AppColors.grey50,
      offset: Offset(0, 0),
    ),
  ];
  static List<BoxShadow>? defaultDeepBoxShadow = [
    const BoxShadow(
      spreadRadius: 1,
      blurRadius: 5,
      color: Color.fromARGB(255, 182, 185, 200),
      offset: Offset(0, 3),
    ),
  ];

  // default dialog width on WEB and APP
  static double defaultDialogSize(BuildContext context) {
    if (kIsWeb) {
      return 400.0;
    } else {
      return DevSize.getWidth(context);
    }
  }

  // default Web width
  static double defaultWebWidth(BuildContext context) {
    var webWidth =
        DevSize.getWidth(context) -
        (AppDef.defaultDesktopBodyMargin(context) * 2);

    return webWidth;
  }

  /// Cache languageCode
  static String defaultCachedLan(BuildContext context) {
    return context.read<LocaleCubit>().state.languageCode;
  }

  /// Supported locales list
  static List<String> defaultSupportedLocalesList = [
    'فارسی',
    'English',
    'عربي',
    'Հայերեն',
    '한국어',
    'Русский',
  ];

  /// Supported locales list
  static List<String> defaultLanguageCodesList = [
    'fa',
    'en',
    'ar',
    'hy',
    'ko',
    'ru',
  ];

  /// isRTL
  static bool defaultIsRTL(BuildContext context) {
    final locale = locator.get<LocaleCubit>();

    return locale.isLocaleRTL();
  }
}
