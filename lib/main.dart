import 'package:flutter/material.dart';
import 'package:fullstacktask/app/app.dart';
import 'package:fullstacktask/app/dependencies.dart';

void main() async {
  await initApp();
  runApp(const WeatherApp());
}