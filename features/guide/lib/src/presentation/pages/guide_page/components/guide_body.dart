import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:guide/src/analytics/analytics.dart';
import 'package:guide/src/presentation/pages/guide_page/components/premium_plan_guide_bar.dart';
import 'package:settings/settings.dart';
import '../../../../../guide.dart';
import '../../../component/guide_theme/list_guide_theme.dart';

class GuideBody extends StatefulWidget {
  final bool transactionAvailable;
  final List<MusicEntity> listMusic;

  const GuideBody({
    Key? key,
    required this.listMusic,
    this.transactionAvailable = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GuideBodyState();
}

class _GuideBodyState extends State<GuideBody> {
  final keySecondItem = GlobalKey();
  double topBar = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        final keySecond = keySecondItem;
        final box = keySecond.currentContext?.findRenderObject() as RenderBox?;
        final position = box?.localToGlobal(const Offset(0, kToolbarHeight));

        setState(() {
          topBar = position?.dy ?? 0;
        });
      } catch (_) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
            ),
            child: ListGuideTheme(
              scrollPhysics: widget.transactionAvailable
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              keySecondItem: keySecondItem,
              items: widget.listMusic
                  .map(
                    GuideThemeViewModel.fromMusic,
                  )
                  .toList(),
              onClickItem: (index) {
                final data = widget.listMusic[index];
                GetIt.I<AnalyticsHelper>().logEvent(
                  BeginGuideEvent.fromTitle(widget.listMusic[index].title),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GuidingPlayerPage(
                      music: data,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        if (!widget.transactionAvailable)
          Positioned(
            left: 0,
            right: 0,
            top: topBar - 30,
            bottom: 0,
            child: PremiumPlanGuideBar(
              onclick: () {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => const SubscriptionPage(),
                  ),
                )
                    .then((value) {
                  Container();
                });
              },
            ),
          ),
      ],
    );
  }
}
