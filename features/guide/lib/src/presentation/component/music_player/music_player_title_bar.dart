import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class MusicPlayerTitleBar extends StatelessWidget {
  final String title;
  const MusicPlayerTitleBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            width: 25,
            child: SvgPicture.asset(AssetsPath.icArrowLeftCircle),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            title,
            style: CustomTextStyle.TITLE_16.apply(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
