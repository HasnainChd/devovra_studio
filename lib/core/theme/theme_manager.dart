import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  ThemeManager._();

  static const String _themeKey = 'theme_mode_preference';
  static final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.light);

  static bool get isDark => themeModeNotifier.value == ThemeMode.dark;

  /// Load the saved theme mode from storage
  static Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedMode = prefs.getString(_themeKey);
      if (savedMode == 'dark') {
        themeModeNotifier.value = ThemeMode.dark;
      } else if (savedMode == 'light') {
        themeModeNotifier.value = ThemeMode.light;
      } else {
        themeModeNotifier.value = ThemeMode.system; // Fallback to system preference
      }
    } catch (e) {
      debugPrint('Error loading theme preference: $e');
    }
  }

  /// Toggle between light and dark modes, then persist the choice
  static Future<void> toggleTheme() async {
    final current = themeModeNotifier.value;
    final newMode = current == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    themeModeNotifier.value = newMode;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themeKey, newMode == ThemeMode.dark ? 'dark' : 'light');
    } catch (e) {
      debugPrint('Error saving theme preference: $e');
    }
  }

  /// Manually set the theme mode, then persist the choice
  static Future<void> setThemeMode(ThemeMode mode) async {
    themeModeNotifier.value = mode;

    try {
      final prefs = await SharedPreferences.getInstance();
      if (mode == ThemeMode.system) {
        await prefs.remove(_themeKey);
      } else {
        await prefs.setString(_themeKey, mode == ThemeMode.dark ? 'dark' : 'light');
      }
    } catch (e) {
      debugPrint('Error setting theme preference: $e');
    }
  }
}
