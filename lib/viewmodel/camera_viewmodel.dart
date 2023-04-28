import 'package:mobx/mobx.dart';

part 'camera_viewmodel.g.dart';

class CameraViewModel = _CameraViewModel with _$CameraViewModel;

abstract class _CameraViewModel with Store {
  @observable
  bool isOn = false;

  @action
  void onCamera(val) => isOn = val;
}