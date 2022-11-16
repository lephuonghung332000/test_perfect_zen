import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  const GradientIcon(this.icon, this.gradient, {super.key});

  final IconData icon;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: Icon(
        icon,
        size: 24,
        color: Colors.white,
      ),
      shaderCallback: (Rect bounds) {
        const Rect rect = Rect.fromLTRB(0, 0, 0, 0);
        return gradient.createShader(rect);
      },
    );
  }
}
