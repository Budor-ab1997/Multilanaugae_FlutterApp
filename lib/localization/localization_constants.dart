import 'package:flutter/material.dart';
import 'package:multilangauge_app/localization/demo_localization.dart';

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).getTranslate(key);
}
