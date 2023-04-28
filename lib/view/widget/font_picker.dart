import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_camera/viewmodel/setting_viewmodel.dart';

import '../../app_theme.dart';

class FontPicker extends StatelessWidget {
  final SettingViewModel vm;

  const FontPicker({
    Key? key,
    required this.vm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Observer(
        builder: (_) => Text(
          '폰트 크기 적용',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: vm.currentFontSize),
        ),
      ),
      content: Observer(
        builder: (_) => Wrap(
          children: [
            ListTile(
              onTap: () => vm.setFontSize(20.0),
              title: const Text(
                "large",
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Radio(
                value: 20.0,
                groupValue: vm.currentFontSize,
                onChanged: null,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ListTile(
              onTap: () => vm.setFontSize(16.0),
              title: const Text(
                "medium",
                style: TextStyle(fontSize: 16.0),
              ),
              trailing: Radio(
                value: 16.0,
                groupValue: vm.currentFontSize,
                onChanged: null,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ListTile(
              onTap: () => vm.setFontSize(14.0),
              title: const Text(
                "small",
                style: TextStyle(fontSize: 14.0),
              ),
              trailing: Radio(
                value: 14.0,
                groupValue: vm.currentFontSize,
                onChanged: null,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Okay',
              style: TextStyle(fontSize: vm.currentFontSize),
            ),
          ),
        )
      ],
      actionsAlignment: MainAxisAlignment.spaceAround,
    );
  }
}

class CupertinoFontPicker extends StatelessWidget {
  final SettingViewModel vm;

  const CupertinoFontPicker({
    Key? key,
    required this.vm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Observer(
        builder: (_) => Text(
          '폰트 크기 적용',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium!.color,
              fontSize: vm.currentFontSize),
        ),
      ),
      content: Observer(
        builder: (_) => Wrap(
          children: [
            CupertinoListTile(
              onTap: () => vm.setFontSize(20.0),
              title: Text(
                "large",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
              trailing: Icon(
                CupertinoIcons.checkmark,
                color: vm.currentFontSize == 20.0
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CupertinoListTile(
              onTap: () => vm.setFontSize(16.0),
              title: Text(
                "medium",
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    fontSize: 16.0),
              ),
              trailing: Icon(
                CupertinoIcons.checkmark,
                color: vm.currentFontSize == 16.0
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CupertinoListTile(
              onTap: () => vm.setFontSize(14.0),
              title: Text(
                "small",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
              trailing: Icon(
                CupertinoIcons.checkmark,
                color: vm.currentFontSize == 14.0
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            'Okay',
            style: TextStyle(fontSize: vm.currentFontSize),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
