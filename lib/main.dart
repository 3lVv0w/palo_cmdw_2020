import 'package:palo_cmdw_2020/scoped_model/app_model.dart';
import 'package:palo_cmdw_2020/widgets/web_body.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(WebApp());
}

class WebApp extends StatelessWidget {
  final AppModel counterModel = AppModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: counterModel,
      child: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppModel appModel =
        ScopedModel.of<AppModel>(context, rebuildOnChange: true);
    return MaterialApp(
      title: 'Palo IT 2020',
      theme: appModel.isDark ? ThemeData.dark() : ThemeData.light(),
      home: SafeArea(
        child: Scaffold(
          body: WebBody(),
        ),
      ),
    );
  }
}
