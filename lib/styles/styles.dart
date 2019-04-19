import 'package:flutter/material.dart';

class Styles {
  static const _textSizeLarge = 17.0;
  static const _textSizeDefault = 15.0;
  static final String _fontNameHeader = 'JosefinSans';

  static final Map<String, Color> _colors = {
    'High-Fat': Color.fromRGBO(255,0,0, 1),
    'Low-Fat': Color.fromRGBO(242,120,75, 1),
    'Low-Carb': Color.fromRGBO(102,51,153, 1),
    'Low-Sodium': Color.fromRGBO(244,208,63, 1),
    'Medium-Carb': Color.fromRGBO(210,82,127, 1),
    'Vegetarian': Color.fromRGBO(38,166,91, 1),
    'Balanced': Color.fromRGBO(65,131,215, 1),
  };

  static final headerLarge = TextStyle(
    fontFamily: _fontNameHeader,
    fontSize: _textSizeLarge,
    fontWeight: FontWeight.normal,
    color: Color.fromRGBO(0, 0, 0, 1),
  );

  static final textDefault = TextStyle(
    fontFamily: _fontNameHeader,
    fontStyle: FontStyle.italic,
    fontSize: _textSizeDefault,
    color: Color.fromRGBO(102, 102, 102, 1),
  );

  static final textDietLabel = (label) => TextStyle(
    fontFamily: _fontNameHeader,
    fontSize: _textSizeDefault,
    fontWeight: FontWeight.w900,
    color: _colors[label]
  );
}