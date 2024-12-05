import 'package:flutter/material.dart';

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius,
      this.child,
      this.showBorder = false,
      this.borderColor,
      this.backgroundColor,
      this.padding,
      this.margin});

  final double? width;
  final double? height;
  final double? radius;
  final Widget? child;
  final bool showBorder;
  final Color? borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 10),
        color: backgroundColor,
        border: showBorder
            ? Border.all(
                color: borderColor ?? Colors.transparent,
              )
            : null,
      ),
      child: child,
    );
  }
}
