import 'package:flutter/material.dart';


class AppColor{
  static  Color whiteColor=const Color.fromRGBO(255, 255, 255, 1);
  static  Color blackColor=Colors.black;
  static Color lightblue=const Color.fromARGB(255, 95, 202, 235);
  static LinearGradient backgroundColor=const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
    Color.fromARGB(255, 67, 159, 235),
    Color.fromARGB(255, 68, 255, 246),
    Color.fromARGB(255, 33, 243, 156),
    Color.fromARGB(255, 59, 193, 255)
  ]);
  static LinearGradient gradient=const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.blue,Color.fromARGB(255, 33, 243, 208)]);
}