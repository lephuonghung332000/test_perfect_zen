import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import '../../../../guide.dart';
import 'components/guiding_body.dart';

class GuidingPlayerPage extends StatelessWidget {
  final MusicEntity music;
  const GuidingPlayerPage({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetIt.I<AnalyticsHelper>().setCurrentScreen(ScreenName.startGuideScreen);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                music.image,
              ),
              fit: BoxFit.cover),
        ),
        child: GuidingBody(
          url: music.url,
          title: music.title,
        ),
      ),
    );
  }
}
