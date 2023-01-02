import 'package:courses/shared_preferences.dart';
import 'package:courses/ui/bottom_navigation_bar.dart';
import 'package:courses/ui/home%20page/home_page.dart';
import 'package:courses/ui/intro%20page/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'flutter localizations/demoLocalizations.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }
}

class _MyAppState extends State<MyApp> {
  // localization
  Locale? _locale;
  String languageCode = '';
  String countryCode = '';

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }


  Future<void> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getString("languageCode") != null) {
        languageCode = prefs.getString("languageCode")!;
        countryCode = prefs.getString("countryCode")!;
        MyApp.setLocale(context, Locale(languageCode, countryCode));
      } else {
        MyApp.setLocale(context, const Locale('en', 'US'));
      }
    });
  }

  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await SharedPreference.getUserLoggedInStatus().then(((value) {
      if(value!=null){
        setState(() {
          isSignedIn =value;
        });
      }
    }));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Courses for you',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      localizationsDelegates: const [
        DemoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (devicelocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == devicelocale!.languageCode &&
              locale.countryCode == devicelocale.countryCode) {
            return devicelocale;
          }
        }
      },
      locale: _locale,
      supportedLocales: const [
        Locale('en', 'US'), // English, no country code
        Locale('ar', 'SA'), // Spanish, no country code
      ],
      home: isSignedIn ?  const BottomNavigationBarPage():const IntroOverboardPage(),
    );
  }
}
