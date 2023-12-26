import 'dart:math';
import 'dart:ui';

class LegaColors {
  static const Color blue = Color(0xFF56E2EB);
  static const Color yellow = Color(0xFFF0F26C);
  static const Color red = Color(0xFFF86C6C);
  static const Color dark = Color(0xFF343543);
  static const Color purple = Color(0xFF7A1CBB);
  static const Color primaryBrand1 = Color(0xFF717BEB);

  static const Color mainTone400 = Color(0xFFF5F5F5);
  static const Color mainTone700 = Color(0xFFB8B8B8);
  static const Color mainTone900 = Color(0xFF858585);
  static const Color primaryContent = Color(0xFF090909);
  static const Color primaryBg = Color(0xFFFFFFFF);

  static List<Color> values = [
    blue,
    yellow,
    red,
    dark,
    purple,
    primaryBrand1,
  ];

  static Color getRandomColor() {
    int index = Random().nextInt(values.length);
    return values[index];
  }
}
