import 'package:flutter/material.dart';

class Styles {
  static const _textSizeLarge = 16.0;
  static const _textSizeDefault = 14.0;
  static final String _fontNameHeader = 'JosefinSans';
  
  static final colorLowCarb = Color.fromRGBO(102,51,153, 1);
  static final colorLowFat = Color.fromRGBO(242,120,75, 1);
  static final colorLowSodium = Color.fromRGBO(244,208,63, 1);
  static final colorMediumCarb = Color.fromRGBO(210,82,127, 1);
  static final colorVegetarian = Color.fromRGBO(38,166,91, 1);
  static final colorBalanced = Color.fromRGBO(65,131,215, 1);

  static final headerLarge = TextStyle(
    fontFamily: _fontNameHeader,
    fontSize: _textSizeLarge,
    color: Color.fromRGBO(0, 0, 0, 1),
  );

  static final textDefault = TextStyle(
    fontFamily: _fontNameHeader,
    fontStyle: FontStyle.italic,
    fontSize: _textSizeDefault,
    color: Color.fromRGBO(102, 102, 102, 1),
  );
}