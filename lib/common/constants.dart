import 'package:flutter/material.dart';

class Constants {
  static const String watchScreen = '/watch_screen';

  static const darkThemeColor = Color(0xff2E2739);
  static const lightThemeColor = Color(0xffEFEFEF);

  static InputDecoration textFieldDecoration = const InputDecoration(
      hintText: 'TV shows, movies and more',
      border: InputBorder.none,
      labelStyle: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Color(0xff202C43)));

}