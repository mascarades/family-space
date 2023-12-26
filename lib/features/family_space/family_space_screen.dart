import 'package:flutter/material.dart';
import 'package:lega_sea/core/static/lega_assets.dart';
import 'package:lega_sea/core/static/lega_colors.dart';
import 'package:lega_sea/features/family_space/add_family_screen.dart';
import 'package:lega_sea/features/family_space/models/family_planet_tag.dart';
import 'package:lega_sea/features/family_space/widgets/family_space.dart';
import 'package:lega_sea/features/family_space/models/family_planet_model.dart';

class FamilySpaceScreen extends StatefulWidget {
  const FamilySpaceScreen({super.key});

  @override
  State<FamilySpaceScreen> createState() => _FamilySpaceScreenState();
}

class _FamilySpaceScreenState extends State<FamilySpaceScreen> {
  final List<FamilyPlanetModel> planets = [
    const FamilyPlanetModel.personal(
      name: 'Viola',
      backgroundColor: Colors.yellow,
      emoji: LegaAssets.youEmoji,
    ),
    ...preset,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(
              Icons.menu,
              color: LegaColors.primaryContent,
            ),
            SizedBox(width: 26),
            Text(
              'Family Space',
              style: TextStyle(
                color: LegaColors.primaryContent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: FamilySpace(
        planets: planets,
        onAddingPlanet: () async {
          final newPlanet = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const AddFamilyScreen();
              },
            ),
          ) as FamilyPlanetModel?;
          if (newPlanet != null) {
            setState(() {
              planets.add(newPlanet);
            });
          }
        },
      ),
    );
  }
}

final List<FamilyPlanetModel> preset = [
  FamilyPlanetModel(
    backgroundColor: LegaColors.red,
    emoji: LegaAssets.momEmoji,
    tag: FamilyTag.values[0],
    name: 'Antony',
  ),
  FamilyPlanetModel(
    backgroundColor: LegaColors.blue,
    emoji: LegaAssets.brotherEmoji,
    tag: FamilyTag.values[2],
    name: 'Drew',
  ),
  FamilyPlanetModel(
    backgroundColor: LegaColors.getRandomColor(),
    emoji: LegaAssets.brotherEmoji,
    tag: FamilyTag.values[4],
    name: 'Drake',
  ),
  FamilyPlanetModel(
    backgroundColor: LegaColors.getRandomColor(),
    emoji: LegaAssets.youEmoji,
    tag: FamilyTag.values[5],
    name: 'Loo',
  ),
  FamilyPlanetModel(
    backgroundColor: LegaColors.getRandomColor(),
    emoji: LegaAssets.brotherEmoji,
    tag: FamilyTag.values[6],
    name: 'Drake',
  ),
  FamilyPlanetModel(
    backgroundColor: LegaColors.getRandomColor(),
    emoji: LegaAssets.youEmoji,
    tag: FamilyTag.values[7],
    name: 'Drake',
  ),
  FamilyPlanetModel(
    backgroundColor: LegaColors.getRandomColor(),
    emoji: LegaAssets.brotherEmoji,
    tag: FamilyTag.values[8],
    name: 'Drake',
  ),
  FamilyPlanetModel(
    backgroundColor: LegaColors.getRandomColor(),
    emoji: LegaAssets.brotherEmoji,
    tag: FamilyTag.values[9],
    name: 'Drake',
  ),
  FamilyPlanetModel(
    backgroundColor: LegaColors.getRandomColor(),
    emoji: LegaAssets.dadEmoji,
    tag: FamilyTag.values[10],
    name: 'Drake',
  ),
  FamilyPlanetModel(
    backgroundColor: LegaColors.getRandomColor(),
    emoji: LegaAssets.brotherEmoji,
    tag: FamilyTag.values[11],
    name: 'Drake',
  ),
  FamilyPlanetModel(
    backgroundColor: LegaColors.getRandomColor(),
    emoji: LegaAssets.brotherEmoji,
    tag: FamilyTag.values[12],
    name: 'Drake',
  ),
  FamilyPlanetModel(
    backgroundColor: LegaColors.getRandomColor(),
    emoji: LegaAssets.brotherEmoji,
    tag: FamilyTag.values[13],
    name: 'Drake',
  ),
];
