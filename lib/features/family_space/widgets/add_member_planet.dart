import 'package:flutter/cupertino.dart';
import 'package:lega_sea/core/static/lega_colors.dart';
import 'package:lega_sea/core/static/lega_consts.dart';
import 'package:lega_sea/widgets/lega_inkwell.dart';

class AddFamilyMemberPlanet extends StatelessWidget {
  final VoidCallback? onPlanetTap;
  const AddFamilyMemberPlanet({
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
            child: LegaInkwell(
              inkShapeBorder: const CircleBorder(),
              shapeBorder: const CircleBorder(),
              materialColor: LegaColors.primaryBrand1,
              onTap: onPlanetTap,
              child: const SizedBox(
                width: 96,
                height: 96,
                child: Icon(
                  CupertinoIcons.add,
                  size: 36,
                  color: LegaColors.mainTone400,
                ),
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
              child: const Center(
                child: Text(
                  '+ Add',
                  style: TextStyle(
                    color: LegaColors.primaryContent,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // child: ,
            ),
          ),
        ],
      ),
    );
  }
}
