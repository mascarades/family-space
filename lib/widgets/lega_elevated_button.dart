import 'package:flutter/material.dart';
import 'package:lega_sea/core/static/lega_colors.dart';

class LegaElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final bool isActive;

  const LegaElevatedButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = LegaColors.primaryBrand1,
    this.isActive = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 56)),
      ),
      onPressed: isActive ? onPressed : null,
      child: Text(
        text,
        style: const TextStyle(
          color: LegaColors.primaryBg,
        ),
      ),
    );
  }
}
