import 'dart:ui';

import 'package:lega_sea/features/family_space/models/family_planet_tag.dart';

class FamilyPlanetModel {
  final FamilyTag tag;
  final String name;
  final Color? backgroundColor;
  final String? emoji;

  const FamilyPlanetModel({
    required this.tag,
    required this.name,
    required this.backgroundColor,
    required this.emoji,
  });

  const FamilyPlanetModel.personal({
    required this.name,
    required this.backgroundColor,
    required this.emoji,
  }) : tag = const FamilyTag.personal();
}
