import 'package:flutter/material.dart';
import 'package:shop_app_using_mvvm/presentation/font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFamily,
        FontWeight fontWeight, Color color) =>
    TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );

// regular style
TextStyle getRegularStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(
      fontSize,
      FontConstants.fontFamily,
      FontWeightManager.regular,
      color,
    );

// semi bold text style
TextStyle getSemiBoldStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(
      fontSize,
      FontConstants.fontFamily,
      FontWeightManager.semiBold,
      color,
    );

// bold text style
TextStyle getBoldStyle(
        {double fontSize = FontSize.s12, required Color color}) =>
    _getTextStyle(
      fontSize,
      FontConstants.fontFamily,
      FontWeightManager.bold,
      color,
    );
