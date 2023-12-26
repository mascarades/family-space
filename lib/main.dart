import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lega_sea/features/family_space/family_space_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const LegaSeaApp());
}

class LegaSeaApp extends StatelessWidget {
  const LegaSeaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FamilySpaceScreen(),
    );
  }
}
