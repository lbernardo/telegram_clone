import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:telegram/lang/default.dart';
import 'package:telegram/lang/en.dart';
import 'package:telegram/lang/pt.dart';

class Lang {
  Lang(this.locale);

  final Locale locale;

  static Lang of(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  ILanguage get content {
    if (locale.languageCode == 'pt') {
      return LanguagePortuguese();
    }
    if (locale.languageCode == 'en') {
      return LanguageEnglish();
    }
  }
}

class DemoLocalizationsDelegate extends LocalizationsDelegate<Lang> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  Future<Lang> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<Lang>(Lang(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
