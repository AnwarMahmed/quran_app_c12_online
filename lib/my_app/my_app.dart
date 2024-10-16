import 'package:flutter/material.dart';
import 'package:test1/config/theme/my_theme.dart';
import 'package:test1/core/routes_manager.dart';
import 'package:test1/prsentation/screens/home/home_screen.dart';
import 'package:test1/prsentation/screens/home/tabs/quran_tabs/widgets/quran_header_widget.dart';
import 'package:test1/prsentation/screens/quran_details_screen/quran_details.dart';
import 'package:test1/prsentation/screens/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      routes: {
        RoutesManager.homeRoute: (_) => HomeScreen(),
        RoutesManager.splashRoute: (context) => SplashScreen(),
        RoutesManager.quranDetailsRoute: (_) => QuranDetailsScreen()
      },
      initialRoute: RoutesManager.splashRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
