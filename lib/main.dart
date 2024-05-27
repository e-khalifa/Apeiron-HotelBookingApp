import 'package:flutter/material.dart';
import 'package:hotel_booking_app/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apeiron Hotel App',
      home: SplashScreen(),
    );
  }
}
