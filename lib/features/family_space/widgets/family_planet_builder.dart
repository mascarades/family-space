import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lega_sea/features/family_space/models/family_planet_model.dart';
import 'package:lega_sea/features/family_space/widgets/add_member_planet.dart';
import 'package:lega_sea/features/family_space/widgets/family_member_planet.dart';

class FamilyPlanetBuilder extends StatelessWidget {
  final FamilyPlanetModel? familyMember;
  final int planetNumber;
  final double orbitRadius;
  final int numberOfPlanetsInOrbit;
  final Animation<double> animation;
  final VoidCallback? onPlanetTap;

  final double x0;
  final double y0;

  const FamilyPlanetBuilder({
    required this.familyMember,
    required this.planetNumber,
    required this.orbitRadius,
    required this.numberOfPlanetsInOrbit,
    required this.animation,
    required this.x0,
    required this.y0,
    this.onPlanetTap,
    super.key,
  });

  double get x {
    double angle = planetNumber * 360 / numberOfPlanetsInOrbit + animation.value + orbitRadius * 0.5;
    double rad = pi / 180 * angle;
    double x = x0 + cos(rad) * orbitRadius;
    return x;
  }

  double get y {
    double angle = planetNumber * 360 / numberOfPlanetsInOrbit + animation.value + orbitRadius * 0.5;
    double rad = pi / 180 * angle;
    double y = y0 + sin(rad) * orbitRadius;
    return y;
  }

  double get scale {
    final orbitNumber = familyMember?.tag.orbitNumber;
    if (orbitNumber == null) {
      return 0.75;
    }
    switch (orbitNumber) {
      case 0:
        return 1;
      case 1:
        return 0.75;
      case 2:
        return 0.5;
      case 3:
        return 0.5;
      default:
        return 0.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Positioned(
          left: x,
          top: y,
          child: Transform.scale(
            scale: scale,
            child: familyMember == null
                ? AddFamilyMemberPlanet(
                    onPlanetTap: onPlanetTap,
                  )
                : FamilyMemberPlanet(
                    familyMember: familyMember!,
                    onPlanetTap: onPlanetTap,
                  ),
          ),
        );
      },
    );
  }
}
