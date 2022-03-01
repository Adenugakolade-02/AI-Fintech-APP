import 'package:flutter/material.dart';

const COLOR_BLUE = Color(0xFF007AFF);
const COLOR_HEADINGS_BLACK = Color(0xFF242731);
const COLOR_BLACK = Color(0xFF242426);
const COLOR_WHITE = Colors.white;
const COLOR_GREY = Color(0xFF575F6E);



const TextTheme TEXT_THEME_DEFAULT = TextTheme(
  headline1: TextStyle(
    color: COLOR_HEADINGS_BLACK, fontWeight: FontWeight.w700, fontSize:32),
  
  headline2: TextStyle(
    color: COLOR_HEADINGS_BLACK, fontWeight: FontWeight.w600, fontSize:20),
  
  headline3: TextStyle(
    color: COLOR_BLACK, fontWeight: FontWeight.w400, fontSize: 14),
  
  headline4: TextStyle(
    color: COLOR_BLACK, fontWeight: FontWeight.w200, fontSize: 18, fontFamily: 'Roboto'),
  
  headline5: TextStyle(
    color: COLOR_WHITE, fontWeight: FontWeight.w800, fontSize: 50, fontFamily: 'Nunito'),

  overline: TextStyle(
    color: Colors.black87, fontWeight: FontWeight.w800, fontSize: 50, fontFamily: 'Nunito'),
  
  subtitle1: TextStyle(
    color: COLOR_GREY, fontWeight: FontWeight.w300, fontSize: 16, fontFamily: 'Roboto'),
  
  subtitle2: TextStyle(
    color: COLOR_BLACK, fontWeight: FontWeight.w300, fontSize: 12),
  
  button: TextStyle(
    color: COLOR_HEADINGS_BLACK, fontWeight: FontWeight.w500, fontSize: 16),
  
  bodyText1: TextStyle(
    color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20, fontFamily: 'Nunito'),
  
  bodyText2: TextStyle(
    color: COLOR_WHITE, fontWeight: FontWeight.w700, fontSize: 20, fontFamily: 'Nunito'),

  headline6: TextStyle(
    color: COLOR_WHITE, fontWeight: FontWeight.w500, fontSize: 16),

);