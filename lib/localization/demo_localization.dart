import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class DemoLocalization {
  final Locale locale;

  DemoLocalization(this.locale);

  static DemoLocalization of(BuildContext context) {
    return Localizations.of<DemoLocalization>(context, DemoLocalization);
  }

  static const LocalizationsDelegate<DemoLocalization> delegate =
      _DemoLocalizationDelegate();

  Map<String, String>
      _localizationString; // to take values from json files to be more flexible

  Future<bool> load() async {
    //method async cause load the data from asset file
    String jsonStringValues =
        await rootBundle.loadString('lang/${locale.languageCode}.json');

    Map<String, dynamic> jsonMap =
        json.decode(jsonStringValues); // create map of json

    _localizationString = jsonMap.map((key, value) =>
        //create map of string
        MapEntry(key, value.toString()));
  }

  String getTranslate(String key) {
    // return type string and need pass key of type string also
    return _localizationString[key];
  }
}

class _DemoLocalizationDelegate
    extends LocalizationsDelegate<DemoLocalization> {
  const _DemoLocalizationDelegate();
  // private class
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported

    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalization> load(Locale locale) async {
    DemoLocalization localization = new DemoLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<DemoLocalization> old) {
    // TODO: implement shouldReload
    return false;
  }
}
