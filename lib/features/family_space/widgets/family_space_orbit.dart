import 'package:flutter/material.dart';
import 'package:lega_sea/core/static/lega_colors.dart';

class FamilySpaceOrbit extends StatelessWidget {
  final double radius;

  const FamilySpaceOrbit({
    required this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: LegaColors.mainTone400,
          width: 2,
        ),
      ),
    );
  }
}
