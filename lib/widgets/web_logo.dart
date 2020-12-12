import 'dart:async';

import 'package:palo_cmdw_2020/scoped_model/app_model.dart';
import 'package:palo_cmdw_2020/shared/statefule_wrapper.dart';
import 'package:palo_cmdw_2020/widgets/sunflower_area.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class WebLogo extends StatelessWidget {
  Future _getThingsOnStartup(AppModel appModel) async {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (appModel.seeds >= 100 && appModel.seeds < 20000) {
          appModel.updateSeed(appModel.seeds + 100.0);
        } else {
          appModel.updateSeed(100);
        }
      },
    );
    Timer.periodic(
      Duration(seconds: 10),
      (timer) {
        appModel.toggleTheme(!appModel.isDark);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appModel = ScopedModel.of<AppModel>(context, rebuildOnChange: true);
    return StatefulWrapper(
      onInit: () {
        _getThingsOnStartup(appModel).then((value) {
          print('Async done');
        });
      },
      child: Stack(
        children: [
          SunFlowerArea(),
          // Positioned(
          //   width: 100,
          //   height: 100,
          //   left: 100,
          //   right: 0,
          //   child: SunFlowerArea(),
          // ),
          // Positioned(
          //   width: 100,
          //   height: 100,
          //   right: 100,
          //   left: 0,
          //   child: SunFlowerArea(),
          // ),
          // Container(
          //   width: 400,
          //   height: 400,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: Colors.transparent,
          //     image: DecorationImage(
          //       image: AssetImage(
          //         appModel.isDark
          //             ? 'images/white_logo_L.png'
          //             : 'images/colour_logo_M.png',
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
