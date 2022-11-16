import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class PlayerButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onClicked;
  const PlayerButton({
    Key? key,
    required this.icon,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(
                icon,
                size: 34,
                color: StaticColors.meditating_feeling,
              ),
              onPressed: onClicked,
            )
          ],
        ),
      );
}
