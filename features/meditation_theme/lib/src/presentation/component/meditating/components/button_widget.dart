import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class ButtonWidget extends StatefulWidget {
  final IconData? icon;
  final VoidCallback onClicked;
  const ButtonWidget({Key? key, required this.onClicked, this.icon}) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
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
              widget.icon,
              size: 34,
              color: StaticColors.meditating_feeling,
            ),
            onPressed: widget.onClicked,
          )
        ],
      ));
}
