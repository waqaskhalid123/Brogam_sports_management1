import 'package:flutter/material.dart';

import '../../services/constants/constants.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onPressed;
  final double? borderRadius;
  final double? paddingHorizontal;
  final double? buttonWidth;
  final FontWeight? fontweight;

  ActionButton(
      {required this.text,
      required this.backgroundColor,
      required this.textColor,
      required this.borderColor,
      required this.onPressed,
      this.borderRadius,
      this.paddingHorizontal,
      this.buttonWidth,
      this.fontweight});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: screenHeight * 0.06,
        width: buttonWidth ?? double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: AppFontSizes.subtitle1,
                color: textColor,
                fontFamily: AppFontsFamily.poppins,
                fontWeight: fontweight),
          ),
        ),
      ),
    );
  }
}
