import 'package:flutter/material.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'components.dart';

class HomeBody extends StatelessWidget {
  final Key? homeAndThemBtn;

  const HomeBody({
    Key? key,
    this.homeAndThemBtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 68,
        right: 16,
        left: 16,
      ),
      child: Column(
        children: [
          const HomeTitle(),
          const SizedBox(height: 15),
          HomeAddTheme(
            key: homeAndThemBtn,
          ),
          const SizedBox(height: 16),
          const ListMeditationTheme(),
        ],
      ),
    );
  }
}
