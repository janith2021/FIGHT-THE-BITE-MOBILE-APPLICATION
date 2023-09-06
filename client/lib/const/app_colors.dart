import 'all_imports.dart';

class AppColors {
  static Color red = _colorFromHex("EF2617");
  static Color green = _colorFromHex("197823");
  static Color white = _colorFromHex("FFFFFF");
  static Color purple = _colorFromHex("9D37E6");
  static Color lightgrey = _colorFromHex("D3D3D3");
  static Color grey = _colorFromHex("A098AE");
  static Color black = _colorFromHex("000000");
  static Color yellow = _colorFromHex("f1c40f");
  static Color orange = _colorFromHex("e67e22");
  static Color pink = _colorFromHex("F49097");
  static Color lightred = _colorFromHex("E74646");
  static Color lightpink = _colorFromHex("FFECBA");
  static Color lightorange = _colorFromHex("FFE1C6");
  static Color lightgreen = _colorFromHex("4CBC9A");
  static Color lightblue = _colorFromHex("5A96E3");
  static Color lightyellow = _colorFromHex("FFFFB2");
  // static Color lightgreen = _colorFromHex("98fb98");
  static Color darkyellow = _colorFromHex("FECC5C");
  static Color darkred = _colorFromHex("BD0026");
  static Color cream = _colorFromHex("fffdd0");
  static Color _colorFromHex(String value) {
    return Color(int.parse("FF$value", radix: 16));
  }
}
