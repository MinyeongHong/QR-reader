import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_camera/viewmodel/setting_viewmodel.dart';

class OptionPicker extends StatelessWidget {
  final SettingViewModel vm;

  const OptionPicker({
    Key? key,
    required this.vm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Theme',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: vm.currentFontSize),
      ),
      content: Observer(
        builder: (_) => Wrap(
          children: [
            ListTile(
              onTap: () => vm.setTheme(ThemeMode.system),
              title: Text(
                "시스템 모드",
                style: TextStyle(fontSize: vm.currentFontSize),
              ),
              trailing: Radio(
                value: ThemeMode.system,
                groupValue: vm.currentMode,
                onChanged: null,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ListTile(
              onTap: () => vm.setTheme(ThemeMode.light),
              title: Text(
                "라이트 모드",
                style: TextStyle(fontSize: vm.currentFontSize),
              ),
              trailing: Radio(
                value: ThemeMode.light,
                groupValue: vm.currentMode,
                onChanged: null,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ListTile(
              onTap: () => vm.setTheme(ThemeMode.dark),
              title: Text(
                "다크 모드",
                style: TextStyle(fontSize: vm.currentFontSize),
              ),
              trailing: Radio(
                value: ThemeMode.dark,
                groupValue: vm.currentMode,
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
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        )
      ],
      actionsAlignment: MainAxisAlignment.spaceAround,
    );
  }
}

class CupertinoOptionPicker extends StatelessWidget {
  final SettingViewModel vm;

  const CupertinoOptionPicker({Key? key, required this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Theme',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontSize: vm.currentFontSize),
      ),
      content: Observer(
        builder: (_) => Wrap(
          children: [
            CupertinoListTile(
              onTap: () => vm.setTheme(ThemeMode.system),
              title: Text(
                "시스템 모드",
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    fontSize: vm.currentFontSize),
              ),
              trailing: Icon(
                CupertinoIcons.checkmark,
                color: vm.currentMode == ThemeMode.system
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CupertinoListTile(
              onTap: () => vm.setTheme(ThemeMode.light),
              title: Text(
                "라이트 모드",
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    fontSize: vm.currentFontSize),
              ),
              trailing: Icon(
                CupertinoIcons.checkmark,
                color: vm.currentMode == ThemeMode.light
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CupertinoListTile(
              onTap: () => vm.setTheme(ThemeMode.dark),
              title: Text(
                "다크 모드",
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    fontSize: vm.currentFontSize),
              ),
              trailing: Icon(
                CupertinoIcons.checkmark,
                color: vm.currentMode == ThemeMode.dark
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
            style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium!.color,
                fontSize: vm.currentFontSize),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
