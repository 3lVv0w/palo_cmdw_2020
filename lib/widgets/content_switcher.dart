import 'package:palo_cmdw_2020/scoped_model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ContentSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppModel appModel =
        ScopedModel.of<AppModel>(context, rebuildOnChange: true);
    return Column(
      children: [
        appModel.isDark
            ? Text("You just reveal an Easter Egg")
            : Text("Don't Toggle"),
        Switch(
          value: appModel.isDark,
          onChanged: (value) => appModel.toggleTheme(value),
          activeTrackColor: Colors.lightBlueAccent,
          activeColor: Colors.blue,
        ),
      ],
    );
  }
}
