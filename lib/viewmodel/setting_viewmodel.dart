import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:qr_camera/respository/setting_repository.dart';

part 'setting_viewmodel.g.dart';

class SettingViewModel = _SettingViewModel with _$SettingViewModel;

abstract class _SettingViewModel with Store {
  final SettingRepository _repo = GetIt.I<SettingRepository>();

  @observable
  ThemeMode? currentMode;

  @observable
  double? currentFontSize;

  @action
  Future<void> initTheme() async {
    await _repo.init();
    currentMode = _repo.prefsAppTheme ?? ThemeMode.system;
    currentFontSize = _repo.prefsAppFontSize ?? 16.0;
  }

  @action
  Future<void> setTheme(ThemeMode mode) async {
    currentMode = mode;
    if (mode == ThemeMode.light)
      await _repo.setLightTheme();
    else if (mode == ThemeMode.dark)
      await _repo.setDarkTheme();
    else
      await _repo.setSystemTheme();
  }

  @action
  Future<void> setFontSize(double sz) async {
    currentFontSize = sz;
    await _repo.setFontSize(sz);
  }
}
