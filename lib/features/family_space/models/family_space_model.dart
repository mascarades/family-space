import 'package:lega_sea/core/static/lega_consts.dart';
import 'package:lega_sea/features/family_space/models/family_orbit_model.dart';
import 'package:lega_sea/features/family_space/models/family_planet_model.dart';

class FamilySpaceModel {
  final FamilyOrbitModel firstOrbit;
  final FamilyOrbitModel secondOrbit;
  final FamilyOrbitModel thirdOrbit;
  final FamilyOrbitModel fourthOrbit;

  final FamilyPlanetModel personalPlanet;

  // Размер пространства
  double get spaceWidth => fourthOrbit.radius * 2 + 100;
  double get spaceHeight => fourthOrbit.radius * 2 + 100;

  //Центр пространства
  double get x0 => spaceWidth / 2 - planetSize / 2;
  double get y0 => spaceHeight / 2 - planetSize / 2;

  FamilySpaceModel({
    required this.firstOrbit,
    required this.secondOrbit,
    required this.thirdOrbit,
    required this.fourthOrbit,
    required this.personalPlanet,
  });
}
