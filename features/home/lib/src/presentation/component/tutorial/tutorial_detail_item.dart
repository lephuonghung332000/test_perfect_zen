import 'package:flutter/material.dart';

class TutorialDetailItem {
  final Offset position;
  final Size size;

  double get dx => position.dx;

  double get dy => position.dy;

  double get width => size.width;

  double get height => size.height;

  TutorialDetailItem({required this.position, required this.size});

  double getBottom(BuildContext context) => MediaQuery.of(context).size.height - dy - height;

  double getRight(BuildContext context) => MediaQuery.of(context).size.width - dx - width;
}
