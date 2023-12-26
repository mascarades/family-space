import 'package:flutter/material.dart';

class LegaInkwell extends StatelessWidget {
  final VoidCallback? onTap;
  final double? inkRadius;
  final BorderRadiusGeometry? borderRadius;
  final Color? materialColor;
  final Color? highlightColor;
  final EdgeInsetsGeometry contentPadding;
  final ShapeBorder? shapeBorder;
  final ShapeBorder? inkShapeBorder;
  final Widget? child;

  const LegaInkwell({
    required this.onTap,
    this.inkRadius,
    this.borderRadius,
    this.materialColor,
    this.highlightColor,
    this.contentPadding = EdgeInsets.zero,
    this.shapeBorder,
    this.inkShapeBorder,
    this.child,
    super.key,
  });

  ShapeBorder? get customBorder {
    if (inkShapeBorder != null) {
      return inkShapeBorder;
    }
    if (inkRadius == null) {
      return null;
    }
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(inkRadius!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius,
      color: materialColor ?? Colors.transparent,
      shape: shapeBorder,
      child: InkWell(
        customBorder: customBorder,
        highlightColor: highlightColor,
        onTap: onTap,
        child: Padding(
          padding: contentPadding,
          child: child,
        ),
      ),
    );
  }
}
