import 'package:flutter/material.dart';

class Styles {
  static const _textSizeLarge = 18.0;
  static const _textSizeDefault = 12.0;
  static final Color _textColorStrong = _hexToColor('000000');
  static final Color _textColorDefault = _hexToColor('666666');
  static final String _fontNameHeader = 'JosefinSans';
  static final String _fontNameDefault = 'Quicksand';
  static final navBarTitle = TextStyle(
    fontFamily: _fontNameDefault,
  );
  static final headerLarge = TextStyle(
    fontFamily: _fontNameHeader,
    fontWeight: FontWeight.bold,
    fontSize: _textSizeLarge,
    color: _textColorStrong,
  );
  static final subHeaderLarge = TextStyle(
    fontFamily: _fontNameHeader,
    fontStyle: FontStyle.italic,
    fontSize: _textSizeLarge,
    color: _textColorStrong,
  );
  static final textDefault = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault,
    color: _textColorDefault,
  );

  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}