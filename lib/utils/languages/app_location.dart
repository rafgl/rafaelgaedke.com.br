import 'dart:ui';

import 'package:testeweb/utils/languages/es.dart';
import 'package:testeweb/utils/languages/pt.dart';
import 'package:get/get.dart';

import 'en.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('pt', 'BR');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('pt', 'BR');

  // Supported languages
  // Needs to be same order with locales
  static final langs = ['Português', 'English', 'Español'];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('pt', ''),
    const Locale('en', ''),
    const Locale('es', ''),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enEn,
        'es': esES,
        'pt': ptPT,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
