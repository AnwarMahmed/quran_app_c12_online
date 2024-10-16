import 'package:flutter/material.dart';
import 'package:test1/core/assets_manager.dart';
import 'package:test1/core/routes_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
    });
    return Scaffold(
        body: Image.asset(
      AssetsManager.lightSplashScreen,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    ));
  }
}
