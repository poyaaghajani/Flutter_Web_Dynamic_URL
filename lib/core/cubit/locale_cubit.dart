import 'package:aloplay_simulation/core/storage/storage_manager.dart';
import 'package:aloplay_simulation/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  final StorageManager _storage = locator.get();

  static const supportedLocales = [
    Locale('en', 'US'), // English
    Locale('fa', 'IR'), // فارسی
    Locale('ar', 'AE'), // عربي
    Locale('hy', 'AM'), // Հայերեն
    Locale('ko', 'KR'), // 한국어
    Locale('ru', 'RU'), // Русский
  ];

  static const Map<String, Locale> stringToLocaleMap = {
    'فارسی': Locale('fa', 'IR'),
    'English': Locale('en', 'US'),
    'عربي': Locale('ar', 'AE'),
    'Հայերեն': Locale('hy', 'AM'),
    '한국어': Locale('ko', 'KR'),
    'Русский': Locale('ru', 'RU'),
  };

  LocaleCubit() : super(const Locale('fa', 'IR')) {
    loadLocalePreference();
  }

  /// Set new language
  void setLanguage(String languageString) async {
    final selectedLocale = stringToLocaleMap[languageString];
    if (selectedLocale != null && state != selectedLocale) {
      emit(selectedLocale);

      // Save the locale in secure storage
      await _storage.setString('localeCode', selectedLocale.languageCode);
    }
  }

  /// Load locale from secure storage
  Future<void> loadLocalePreference() async {
    try {
      String? localeCode = await _storage.getString('localeCode');
      emit(
        supportedLocales.firstWhere(
          (locale) => locale.languageCode == localeCode,
          orElse: () => const Locale('fa', 'IR'),
        ),
      );
    } catch (e) {
      emit(const Locale('fa', 'IR'));
    }
  }

  /// Get selected language
  String selectedLanguage() {
    return stringToLocaleMap.entries
        .firstWhere(
          (entry) => entry.value.languageCode == state.languageCode,
          orElse: () => const MapEntry('فارسی', Locale('fa', 'IR')),
        )
        .key;
  }

  /// Check if locale is RTL
  bool isLocaleRTL() {
    return ['fa', 'ar'].contains(state.languageCode);
  }
}
