// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingViewModel on _SettingViewModel, Store {
  late final _$currentModeAtom =
      Atom(name: '_SettingViewModel.currentMode', context: context);

  @override
  ThemeMode? get currentMode {
    _$currentModeAtom.reportRead();
    return super.currentMode;
  }

  @override
  set currentMode(ThemeMode? value) {
    _$currentModeAtom.reportWrite(value, super.currentMode, () {
      super.currentMode = value;
    });
  }

  late final _$currentFontSizeAtom =
      Atom(name: '_SettingViewModel.currentFontSize', context: context);

  @override
  double? get currentFontSize {
    _$currentFontSizeAtom.reportRead();
    return super.currentFontSize;
  }

  @override
  set currentFontSize(double? value) {
    _$currentFontSizeAtom.reportWrite(value, super.currentFontSize, () {
      super.currentFontSize = value;
    });
  }

  late final _$initThemeAsyncAction =
      AsyncAction('_SettingViewModel.initTheme', context: context);

  @override
  Future<void> initTheme() {
    return _$initThemeAsyncAction.run(() => super.initTheme());
  }

  late final _$setThemeAsyncAction =
      AsyncAction('_SettingViewModel.setTheme', context: context);

  @override
  Future<void> setTheme(ThemeMode mode) {
    return _$setThemeAsyncAction.run(() => super.setTheme(mode));
  }

  late final _$setFontSizeAsyncAction =
      AsyncAction('_SettingViewModel.setFontSize', context: context);

  @override
  Future<void> setFontSize(double sz) {
    return _$setFontSizeAsyncAction.run(() => super.setFontSize(sz));
  }

  @override
  String toString() {
    return '''
currentMode: ${currentMode},
currentFontSize: ${currentFontSize}
    ''';
  }
}
