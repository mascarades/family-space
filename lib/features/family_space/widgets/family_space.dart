import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lega_sea/core/static/lega_colors.dart';
import 'package:lega_sea/core/static/lega_consts.dart';
import 'package:lega_sea/features/family_space/controller/family_space_controller.dart';
import 'package:lega_sea/features/family_space/models/family_orbit_model.dart';
import 'package:lega_sea/features/family_space/models/family_planet_model.dart';
import 'package:lega_sea/features/family_space/models/family_space_model.dart';
import 'package:lega_sea/features/family_space/widgets/family_member_planet.dart';
import 'package:lega_sea/features/family_space/widgets/family_planet_builder.dart';
import 'package:lega_sea/features/family_space/widgets/family_space_orbit.dart';

class FamilySpace extends StatefulWidget {
  final List<FamilyPlanetModel> planets;
  final AsyncCallback onAddingPlanet;

  const FamilySpace({
    required this.planets,
    required this.onAddingPlanet,
    super.key,
  });

  @override
  State<FamilySpace> createState() => _FamilySpaceState();
}

class _FamilySpaceState extends State<FamilySpace> with SingleTickerProviderStateMixin {
  final TransformationController _transformationController = TransformationController();
  final FamilySpaceController _spaceController = FamilySpaceController();

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(minutes: 2),
  );

  late final Animation<double> _tweenAnimation = _animationController.drive(
    Tween<double>(begin: 0, end: 360),
  );

  late FamilySpaceModel _familySpaceModel;

  double get x0 => _familySpaceModel.x0;
  double get y0 => _familySpaceModel.y0;

  FamilyOrbitModel get firstOrbit => _familySpaceModel.firstOrbit;
  FamilyOrbitModel get secondOrbit => _familySpaceModel.secondOrbit;
  FamilyOrbitModel get thirdOrbit => _familySpaceModel.thirdOrbit;
  FamilyOrbitModel get fourthOrbit => _familySpaceModel.fourthOrbit;

  // ValueNotifier<bool> loading = ValueNotifier<bool>(false);

  bool loading = true;

  @override
  void didUpdateWidget(covariant FamilySpace oldWidget) {
    super.didUpdateWidget(oldWidget);
    _familySpaceModel = _spaceController.getFamilySpace(widget.planets);
  }

  @override
  void initState() {
    super.initState();
    _familySpaceModel = _spaceController.getFamilySpace(widget.planets);

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _animationController.repeat();
        _transformationController.value = Matrix4.identity()
          ..translate(
            -_familySpaceModel.spaceWidth / 2 + MediaQuery.of(context).size.width / 2,
            -_familySpaceModel.spaceHeight / 2 + MediaQuery.of(context).size.height / 2.5,
          );
        setState(() {
          loading = false;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _transformationController.dispose();
    _animationController.dispose();
  }

  List<Widget> get orbits => [
        Positioned(
          left: x0 - firstOrbit.radius + planetSize / 2,
          top: y0 - firstOrbit.radius + planetSize / 2,
          child: FamilySpaceOrbit(
            radius: firstOrbit.radius,
          ),
        ),
        Positioned(
          left: x0 - secondOrbit.radius + planetSize / 2,
          top: y0 - secondOrbit.radius + planetSize / 2,
          child: FamilySpaceOrbit(
            radius: secondOrbit.radius,
          ),
        ),
        Positioned(
          left: x0 - thirdOrbit.radius + planetSize / 2,
          top: y0 - thirdOrbit.radius + planetSize / 2,
          child: FamilySpaceOrbit(
            radius: thirdOrbit.radius,
          ),
        ),
        Positioned(
          left: x0 - fourthOrbit.radius + planetSize / 2,
          top: y0 - fourthOrbit.radius + planetSize / 2,
          child: FamilySpaceOrbit(
            radius: fourthOrbit.radius,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container(
        color: LegaColors.primaryBg,
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      );
    }
    return InteractiveViewer(
      minScale: 0.1,
      transformationController: _transformationController,
      constrained: false,
      child: Container(
        color: Colors.white,
        width: _familySpaceModel.spaceWidth,
        height: _familySpaceModel.spaceHeight,
        child: SizedBox(
          height: 1,
          width: 1,
          child: Stack(
            children: [
              ...orbits,
              Positioned(
                left: x0,
                top: y0,
                child: FamilyMemberPlanet(
                  familyMember: _familySpaceModel.personalPlanet,
                ),
              ),
              for (int i = 0; i < firstOrbit.planets.length; i++)
                FamilyPlanetBuilder(
                  familyMember: firstOrbit.planets[i],
                  planetNumber: i,
                  orbitRadius: firstOrbit.radius,
                  numberOfPlanetsInOrbit: firstOrbit.planets.length + 1,
                  animation: _tweenAnimation,
                  x0: x0,
                  y0: y0,
                ),
              FamilyPlanetBuilder(
                familyMember: null,
                planetNumber: firstOrbit.planets.length,
                orbitRadius: firstOrbit.radius,
                numberOfPlanetsInOrbit: firstOrbit.planets.length + 1,
                animation: _tweenAnimation,
                x0: x0,
                y0: y0,
                onPlanetTap: () async {
                  _animationController.stop();
                  await widget.onAddingPlanet();
                  _animationController.repeat();
                },
              ),
              for (int i = 0; i < secondOrbit.planets.length; i++)
                FamilyPlanetBuilder(
                  familyMember: secondOrbit.planets[i],
                  planetNumber: i,
                  orbitRadius: secondOrbit.radius,
                  numberOfPlanetsInOrbit: secondOrbit.planets.length,
                  animation: _tweenAnimation,
                  x0: x0,
                  y0: y0,
                ),
              for (int i = 0; i < thirdOrbit.planets.length; i++)
                FamilyPlanetBuilder(
                  familyMember: thirdOrbit.planets[i],
                  planetNumber: i,
                  orbitRadius: thirdOrbit.radius,
                  numberOfPlanetsInOrbit: thirdOrbit.planets.length,
                  animation: _tweenAnimation,
                  x0: x0,
                  y0: y0,
                ),
              for (int i = 0; i < fourthOrbit.planets.length; i++)
                FamilyPlanetBuilder(
                  familyMember: fourthOrbit.planets[i],
                  planetNumber: i,
                  orbitRadius: fourthOrbit.radius,
                  numberOfPlanetsInOrbit: fourthOrbit.planets.length,
                  animation: _tweenAnimation,
                  x0: x0,
                  y0: y0,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
