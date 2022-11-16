import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class GuideActionButton extends StatelessWidget {
  final Function onClickPlay;
  const GuideActionButton({
    super.key,
    required this.onClickPlay,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClickPlay.call();
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7B61FF).withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: RawMaterialButton(
          onPressed: () {
            onClickPlay.call();
          },
          fillColor: Colors.white,
          shape: const CircleBorder(),
          child: SvgPicture.asset(
            AssetsPath.icPlayMusic,
          ),
        ),
      ),
    );
  }
}
