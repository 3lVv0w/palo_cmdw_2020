import 'package:palo_cmdw_2020/scoped_model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ContentSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppModel appModel =
        ScopedModel.of<AppModel>(context, rebuildOnChange: true);
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 300),
      child: Slider.adaptive(
        min: 20,
        max: 20000,
        value: appModel.seeds,
        onChanged: (newValue) => appModel.updateSeed(newValue),
      ),
    );
  }
}
