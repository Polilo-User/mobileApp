import 'package:flutter/material.dart';
import 'package:mobile_app_/theme/theme.dart';
import 'package:mobile_app_/router/router.dart';

class MobileApp extends StatelessWidget {
  const MobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HouseMobileApp',
      theme: whiteTheme,
      routes: routes,
    );
  }
}
