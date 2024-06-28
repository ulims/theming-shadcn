import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadtheming/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorProvider extends ChangeNotifier {
  ColorOption _selectedColor = ColorOption.red;
  static const String _colorKey = 'selected_color';

  ColorOption get selectedColor => _selectedColor;

  ColorProvider() {
    _loadSelectedColor();
  }

  Future<void> _loadSelectedColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorName = prefs.getString(_colorKey);
    if (colorName != null) {
      _selectedColor = ColorOption.values.firstWhere(
        (option) => option.name == colorName,
        orElse: () => ColorOption.red, // Fallback to red if not found
      );
    } else {
      _selectedColor = ColorOption.values.first;
    }
    notifyListeners();
  }

  Future<void> setSelectedColor(ColorOption color) async {
    _selectedColor = color;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_colorKey, color.name);
    notifyListeners();
  }

  getColorScheme() {
    switch (_selectedColor) {
      case ColorOption.red:
        return (const ShadRedColorScheme.light(), const ShadRedColorScheme.dark());

      case ColorOption.blue:
        return (const ShadBlueColorScheme.light()
        , const ShadBlueColorScheme.dark());
      case ColorOption.green:
        return (const ShadGreenColorScheme.light(), const ShadGreenColorScheme.dark());

      case ColorOption.cyan:
        return (
          const ShadOrangeColorScheme.light(), const ShadVioletColorScheme.dark()
        );
    }
  }
}
