import 'package:flutter/material.dart';

class Styles {
  static const _textSizeLarge = 16.0;
  static const _textSizeDefault = 14.0;
  static final String _fontNameHeader = 'JosefinSans';

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