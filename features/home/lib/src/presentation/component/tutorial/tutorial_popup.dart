import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/src/presentation/component/tutorial/keys/tutorial_keys.dart';
import 'package:preferences/preferences.dart';

import 'tutorial.dart';

class TutorialPopup extends StatelessWidget {
  final TutorialDetailItem detailHomeAndTheme;

  const TutorialPopup({
    Key? key,
    required this.detailHomeAndTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetIt.I<AnalyticsHelper>().setCurrentScreen(ScreenName.tutorialScreen);
    return Scaffold(
      key: TutorialKey.tutorialKey,
      backgroundColor: StaticColors.dask_mask,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: detailHomeAndTheme.dx,
            width: detailHomeAndTheme.width,
            bottom: detailHomeAndTheme.getBottom(context),
            child: const TutorialHomeAndTheme(),
          ),
          Positioned(
            right: detailHomeAndTheme.dx + 16,
            top: MediaQuery.of(context).size.height -
                detailHomeAndTheme.getBottom(context) +
                32,
            child: const TutorialPlayButton(),
          ),
          const Positioned(
            bottom: 0,
            left: 12,
            right: 12,
            child: TutorialBottomNav(),
          )
        ],
      ),
    );
  }

  static OverlayEntry show(
    BuildContext context, {
    required TutorialDetailItem detailHomeAndTheme,
    VoidCallback? onTap,
  }) {
    final overlayEntry = OverlayEntry(
      maintainState: true,
      builder: (context) {
        return GestureDetector(
          key: TutorialKey.gestureDetectorPopUp,
          onTap: onTap,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: TutorialPopup(
              detailHomeAndTheme: detailHomeAndTheme,
            ),
          ),
        );
      },
    );

    Overlay.of(context)?.insert(overlayEntry);

    return overlayEntry;
  }
}

extension GlobalKeyExt on GlobalKey {
  TutorialDetailItem? get detail {
    final box = currentContext?.findRenderObject() as RenderBox?;
    final position = box?.localToGlobal(Offset.zero);
    final size = box?.size;

    if (position == null || size == null) {
      return null;
    }

    return TutorialDetailItem(position: position, size: size);
  }
}
