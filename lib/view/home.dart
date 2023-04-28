import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_camera/view/widget/font_picker.dart';
import 'package:qr_camera/viewmodel/setting_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app_theme.dart';
import '../viewmodel/camera_viewmodel.dart';
import 'widget/option_picker.dart';

class HomeScreen extends StatelessWidget {
  final SettingViewModel settingVm;

  const HomeScreen({Key? key, required this.settingVm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = CameraViewModel();

    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(
            "QR Scanner",
            style: TextStyle(fontSize: settingVm.currentFontSize),
          ),
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.font_download_outlined,
              ),
              onPressed: () {
                if (Platform.isIOS) {
                  showCupertinoDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) => CupertinoFontPicker(
                      vm: settingVm,
                    ),
                  );
                } else {
                  showDialog<void>(
                    barrierDismissible: true,
                    barrierColor: Colors.black26,
                    context: context,
                    builder: (context) => FontPicker(
                      vm: settingVm,
                    ),
                  );
                }
              }),
          IconButton(
            icon: const Icon(Icons.contrast_rounded),
            onPressed: () {
              if (Platform.isIOS) {
                showCupertinoDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) =>
                      CupertinoOptionPicker(vm: settingVm),
                );
              } else {
                showDialog<void>(
                  barrierDismissible: true,
                  barrierColor: Colors.black26,
                  context: context,
                  builder: (context) => OptionPicker(
                    vm: settingVm,
                  ),
                );
              }
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              color: Theme.of(context).cardColor,
              child: Observer(
                builder: (_) => vm.isOn
                    ? MobileScanner(
                        controller: MobileScannerController(
                          detectionSpeed: DetectionSpeed.normal,
                          facing: CameraFacing.back,
                          torchEnabled: false,
                        ),
                        onDetect: (capture) async {
                          final Barcode barcode = capture.barcodes.first;

                          final result = await showModalBottomSheet<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 150,
                                color: Theme.of(context).cardColor,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        barcode.rawValue!,
                                        style: TextStyle(
                                          fontSize: settingVm.currentFontSize,
                                        ),
                                      ),
                                      Text(
                                        '해당 웹 페이지로 이동하시겠습니까?',
                                        style: TextStyle(
                                          fontSize: settingVm.currentFontSize,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextButton(
                                        child: Text(
                                          '이동하기',
                                          style: TextStyle(
                                            fontSize: settingVm.currentFontSize,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context, true);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                          if (result != null && result) {
                            await _launchUrl(
                              Uri.parse(barcode.rawValue!),
                            );
                          }
                        },
                        errorBuilder: (BuildContext context,
                            MobileScannerException error, Widget? child) {
                          return Center(
                            child: Text(
                              "카메라 권한을 허용한 뒤 다시 시도해주세요.",
                              style: TextStyle(
                                  fontSize: settingVm.currentFontSize),
                            ),
                          );
                        },
                      )
                    : const SizedBox(),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Observer(
              builder: (_) => Text(
                "To scan the QR code,\n press and hold the 'SCANNING' button.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: settingVm.currentFontSize),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTapDown: (details) {
                vm.onCamera(true);
              },
              onTapCancel: () {
                vm.onCamera(false);
              },
              onTapUp: (details) {
                vm.onCamera(false);
              },
              child: Container(
                color: Theme.of(context).primaryColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Observer(
                  builder: (_) => Text(
                    'SCANNING',
                    style: TextStyle(fontSize: settingVm.currentFontSize),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      throw Exception('Could not launch $uri');
    }
  }
}
