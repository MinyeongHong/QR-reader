import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_camera/view/home.dart';
import 'package:qr_camera/viewmodel/setting_viewmodel.dart';

import 'app_theme.dart';
import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  final settingVm = SettingViewModel();
  await settingVm.initTheme();

  runApp(MyApp(settingVm));
}

class MyApp extends StatelessWidget {
  final SettingViewModel settingVm;

  MyApp(this.settingVm);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: settingVm.currentMode,
        home: HomeScreen(
          settingVm: settingVm,
        ),
      ),
    );
  }
}
