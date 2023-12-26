import 'package:lega_sea/features/family_space/models/family_planet_model.dart';

class FamilyOrbitModel {
  final List<FamilyPlanetModel> planets;
  final double radius;

  const FamilyOrbitModel({
    required this.planets,
    required this.radius,
  });
}
