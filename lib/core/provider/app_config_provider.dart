import 'package:exam_app/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AppConfigProvider extends ChangeNotifier {
  SharedPreferences sharedPreferences;
  AppConfigProvider(this.sharedPreferences);
  String slelectedlocale = Constant.enLocaleKey;
  bool isEn() => slelectedlocale == Constant.enLocaleKey;

  Future<void> changeLocale(String locale) async {
    if (locale == slelectedlocale) return;
    slelectedlocale = locale;
    await sharedPreferences.setString(Constant.localeKey, locale);
    notifyListeners();
  }

  Future<void> setSlectedLocale() async {
    final slelected =
        sharedPreferences.getString(Constant.localeKey) ?? Constant.enLocaleKey;

    slelectedlocale = slelected;
    notifyListeners();
  }
}
