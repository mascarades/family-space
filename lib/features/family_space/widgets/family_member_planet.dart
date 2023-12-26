import 'package:flutter/cupertino.dart';
import 'package:lega_sea/core/static/lega_colors.dart';
import 'package:lega_sea/core/static/lega_consts.dart';
import 'package:lega_sea/features/family_space/models/family_planet_model.dart';

class FamilyMemberPlanet extends StatelessWidget {
  final FamilyPlanetModel familyMember;
  final VoidCallback? onPlanetTap;

  const FamilyMemberPlanet({
    required this.familyMember,
    this.onPlanetTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: planetSize,
      height: planetSize,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            child: Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: familyMember.backgroundColor,
              ),
              child: Image.asset(
                familyMember.emoji ?? '',
                errorBuilder: (context, url, error) {
                  return const Center(
                    child: Text(
                      'Not found',
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 42,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: LegaColors.mainTone400,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    familyMember.tag.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: LegaColors.mainTone900,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    familyMember.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: LegaColors.primaryContent,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              // child: ,
            ),
          ),
        ],
      ),
    );
  }
}
