import 'package:flutter/material.dart';
import 'package:weather_api/screen/weatherScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const WeatherScreen(),
    },
  ));
}
