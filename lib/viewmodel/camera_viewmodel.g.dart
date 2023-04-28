// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CameraViewModel on _CameraViewModel, Store {
  late final _$isOnAtom = Atom(name: '_CameraViewModel.isOn', context: context);

  @override
  bool get isOn {
    _$isOnAtom.reportRead();
    return super.isOn;
  }

  @override
  set isOn(bool value) {
    _$isOnAtom.reportWrite(value, super.isOn, () {
      super.isOn = value;
    });
  }

  late final _$_CameraViewModelActionController =
      ActionController(name: '_CameraViewModel', context: context);

  @override
  void onCamera(dynamic val) {
    final _$actionInfo = _$_CameraViewModelActionController.startAction(
        name: '_CameraViewModel.onCamera');
    try {
      return super.onCamera(val);
    } finally {
      _$_CameraViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isOn: ${isOn}
    ''';
  }
}
