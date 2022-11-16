import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class BulletList extends StatelessWidget {
  final List<String> strings;

  const BulletList(this.strings, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings.map(
          (str) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AssetsPath.icCheckCircle,
                      width: 15,
                      height: 15,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        str,
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: CustomTextStyle.BODY_14.apply(
                          color: StaticColors.item_color,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
