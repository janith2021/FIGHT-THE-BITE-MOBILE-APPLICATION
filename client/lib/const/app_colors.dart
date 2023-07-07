import 'all_imports.dart';

class AppColors {
  static Color red = _colorFromHex("EF2617");
  static Color green = _colorFromHex("197823");
  static Color white = _colorFromHex("FFFFFF");
  static Color purple = _colorFromHex("9D37E6");

  static Color _colorFromHex(String value) {
    return Color(int.parse("FF$value", radix: 16));
  }
}
