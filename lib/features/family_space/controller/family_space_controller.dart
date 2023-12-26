import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lega_sea/core/static/lega_consts.dart';
import 'package:lega_sea/features/family_space/models/family_orbit_model.dart';
import 'package:lega_sea/features/family_space/models/family_planet_model.dart';
import 'package:lega_sea/features/family_space/models/family_space_model.dart';

const double _primaryFirstOrbitRadius = 150;
const double _primarySecondOrbitRadius = 250;
const double _primaryThirdOrbitRadius = 350;
const double _primaryFourthOrbitRadius = 450;

const double _minRadiusDistance = 100;

class FamilySpaceController {
  FamilySpaceModel getFamilySpace(List<FamilyPlanetModel> planets) {
    final personalPlanet = planets.firstWhere(
      (member) => member.tag.orbitNumber == 0,
      orElse: () => const FamilyPlanetModel.personal(backgroundColor: Colors.yellow, emoji: '', name: ''),
    );
    final planetsInFirstOrbit = planets.where((member) => member.tag.orbitNumber == 1).toList();
    final planetsInSecondOrbit = planets.where((member) => member.tag.orbitNumber == 2).toList();
    final planetsInThirdOrbit = planets.where((member) => member.tag.orbitNumber == 3).toList();
    final planetsInFourthOrbit = planets.where((member) => member.tag.orbitNumber == 4).toList();

    final firstOrbit = _getFamilyOrbit(planetsInFirstOrbit, _primaryFirstOrbitRadius, 0, 0.75);
    final secondOrbit = _getFamilyOrbit(planetsInSecondOrbit, _primarySecondOrbitRadius, firstOrbit.radius, 0.5);
    final thirdOrbit = _getFamilyOrbit(planetsInThirdOrbit, _primaryThirdOrbitRadius, secondOrbit.radius, 0.5);
    final fourthOrbit = _getFamilyOrbit(planetsInFourthOrbit, _primaryFourthOrbitRadius, thirdOrbit.radius, 0.5);

    return FamilySpaceModel(
      personalPlanet: personalPlanet,
      firstOrbit: firstOrbit,
      secondOrbit: secondOrbit,
      thirdOrbit: thirdOrbit,
      fourthOrbit: fourthOrbit,
    );
  }

  FamilyOrbitModel _getFamilyOrbit(
    List<FamilyPlanetModel> planets,
    double primaryOrbitRadius,
    double previousOrbitRadius, [
    double scale = 1,
  ]) {
    double orbitRadius = primaryOrbitRadius;
    if (orbitRadius - previousOrbitRadius < _minRadiusDistance) {
      orbitRadius = previousOrbitRadius + _minRadiusDistance;
    }

    final minRadius = _getMinOrbitRadius(orbitRadius, planets.length, scale);
    if (minRadius > orbitRadius) {
      orbitRadius = minRadius;
    }

    final firstFamilyOrbit = FamilyOrbitModel(planets: planets, radius: orbitRadius);
    return firstFamilyOrbit;
  }

  //Минимальный радиус орбиты при соблюдении условия,
  //Что расстояние между планетами не меньше их удвоенного размера
  double _getMinOrbitRadius(double orbitRadius, int totalNumberOfPlanets, [double scale = 1]) {
    final radius = planetSize * totalNumberOfPlanets * scale / pi;
    return radius;
  }
}
