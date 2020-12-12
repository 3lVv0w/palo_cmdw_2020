import 'package:palo_cmdw_2020/scoped_model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:math' as math;

final Color primaryColor = Colors.orange;

class SunFlowerArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppModel appModel =
        ScopedModel.of<AppModel>(context, rebuildOnChange: true);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
      ),
      child: SizedBox(
        width: width - 100,
        height: width - 700,
        child: CustomPaint(
          painter: _SunflowerPainter(appModel.sunFlowerSeeds),
        ),
      ),
    );
  }
}

class _SunflowerPainter extends CustomPainter {
  static const seedRadius = 2.0;
  static const scaleFactor = 6;
  static const tau = math.pi * 2;

  static final phi = (math.sqrt(5) + 1) / 2;

  final int seeds;

  _SunflowerPainter(this.seeds);

  @override
  void paint(Canvas canvas, Size size) {
    var center = size.width / 2;

    for (var i = 0; i < seeds; i++) {
      var theta = i * tau / phi;
      var r = math.sqrt(i) * scaleFactor;
      var x = center + r * math.cos(theta);
      var y = center - r * math.sin(theta);
      var offset = Offset(x, y);
      if (!size.contains(offset)) {
        continue;
      }
      drawSeed(canvas, x, y);
    }
  }

  @override
  bool shouldRepaint(_SunflowerPainter oldDelegate) {
    return oldDelegate.seeds != this.seeds;
  }

  // Draw a small circle representing a seed centered at (x,y).
  void drawSeed(Canvas canvas, num x, num y) {
    var paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..color = primaryColor;
    canvas.drawCircle(Offset(x, y), seedRadius, paint);
  }
}
