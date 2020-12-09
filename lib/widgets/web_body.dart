import 'package:palo_cmdw_2020/widgets/web_logo.dart';
import 'package:palo_cmdw_2020/widgets/content_switcher.dart';
import 'package:flutter/material.dart';

class WebBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          WebLogo(),
          SizedBox(
            height: 10.0,
          ),
          ContentSwitcher(),
          SizedBox(
            height: 10.0,
          ),
          // ContentSlider(),
        ],
      ),
    );
  }
}
