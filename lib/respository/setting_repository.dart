import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingRepository {
  static const String KEY_THEME = "Theme";
  static const String KEY_FONT_SIZE = "Font";

  static const String light = "light";
  static const String dark = "dark";
  static const String system = "system";

  static SharedPreferences? _prefsInstance;

  ThemeMode? prefsAppTheme;
  double? prefsAppFontSize;

  static Future<SharedPreferences> get _instance async {
    _prefsInstance ??= await SharedPreferences.getInstance();
    return _prefsInstance!;
  }

  Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;

    prefsAppTheme = getTheme();
    prefsAppFontSize = getFontSize();

    return _prefsInstance;
  }

  double getFontSize() {
    return _prefsInstance!.getDouble(KEY_FONT_SIZE) ??  16.0;
  }

  Future<void> setFontSize(double fontSize) async =>
      await _prefsInstance!.setDouble(KEY_FONT_SIZE, fontSize);

  ThemeMode getTheme() {
    String? currentTheme = _prefsInstance!.getString(KEY_THEME);

    if (currentTheme == light) {
      return ThemeMode.light;
    } else if (currentTheme == dark) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  Future<void> setSystemTheme() async =>
      await _prefsInstance!.setString(KEY_THEME, system);

  Future<void> setLightTheme() async =>
      await _prefsInstance!.setString(KEY_THEME, light);

  Future<void> setDarkTheme() async =>
      await _prefsInstance!.setString(KEY_THEME, dark);

  Future<void> deleteTheme() async => _prefsInstance!.remove(KEY_THEME);
}
