import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:telegram/app/config.dart';
import 'package:telegram/lang/lang.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Telegram clone',
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,        
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
        const Locale('pt', ''),
      ],
      theme: ThemeData(
        primaryColor: ConfigDefault.primaryColorDefault,
        accentColor: ConfigDefault.accentColorDefault,
        floatingActionButtonTheme: FloatingActionButtonThemeData(foregroundColor: ConfigDefault.foregroundColor)
      ),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
