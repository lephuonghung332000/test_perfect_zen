import 'dart:math' as math;

import 'package:flutter/material.dart';

class DashesBorder extends StatelessWidget {
  final Color? color;
  final double strokeWidth;
  final double gap;
  final Widget child;

  const DashesBorder({
    super.key,
    this.color,
    this.strokeWidth = 1.0,
    this.gap = 5.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(strokeWidth / 2),
      child: CustomPaint(
        painter: _DashRectPainter(
            color: color ?? Theme.of(context).disabledColor,
            strokeWidth: strokeWidth,
            gap: gap),
        child: child,
      ),
    );
  }
}

class _DashRectPainter extends CustomPainter {
  double strokeWidth;
  Color? color;
  double gap;

  _DashRectPainter({this.strokeWidth = 5.0, this.color, this.gap = 5.0});

  @override
  void paint(Canvas canvas, Size size) {
    // ignore: omit_local_variable_types
    Paint dashedPaint = Paint()
      ..color = color!
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    var x = size.width;
    var y = size.height;

    var _topPath = getDashedPath(
      a: const math.Point(0, 0),
      b: math.Point(x, 0),
      gap: gap,
    );

    var _rightPath = getDashedPath(
      a: math.Point(x, 0),
      b: math.Point(x, y),
      gap: gap,
    );

    var _bottomPath = getDashedPath(
      a: math.Point(0, y),
      b: math.Point(x, y),
      gap: gap,
    );

    var _leftPath = getDashedPath(
      a: const math.Point(0, 0),
      b: math.Point(0.001, y),
      gap: gap,
    );

    canvas.drawPath(_topPath, dashedPaint);
    canvas.drawPath(_rightPath, dashedPaint);
    canvas.drawPath(_bottomPath, dashedPaint);
    canvas.drawPath(_leftPath, dashedPaint);
  }

  Path getDashedPath({
    required math.Point<double> a,
    required math.Point<double> b,
    // ignore: type_annotate_public_apis
    @required gap,
  }) {
    var size = Size(b.x - a.x, b.y - a.y);
    var path = Path();
    path.moveTo(a.x, a.y);
    var shouldDraw = true;
    var currentPoint = math.Point(a.x, a.y);

    num radians = math.atan(size.height / size.width);

    num dx = math.cos(radians) * gap < 0
        ? math.cos(radians) * gap * -1
        : math.cos(radians) * gap;

    num dy = math.sin(radians) * gap < 0
        ? math.sin(radians) * gap * -1
        : math.sin(radians) * gap;

    while (currentPoint.x <= b.x && currentPoint.y <= b.y) {
      shouldDraw
          ? path.lineTo(currentPoint.x, currentPoint.y)
          : path.moveTo(currentPoint.x, currentPoint.y);
      shouldDraw = !shouldDraw;
      currentPoint = math.Point(
        currentPoint.x + dx,
        currentPoint.y + dy,
      );
    }
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
