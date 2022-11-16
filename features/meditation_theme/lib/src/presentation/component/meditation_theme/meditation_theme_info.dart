import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class MeditationThemeInfo extends StatelessWidget {
  const MeditationThemeInfo({
    Key? key,
    required this.title,
    required this.duration,
    this.intervalBellDuration,
    this.intervalBellName,
    this.mainMusicName,
    required this.isPremium,
    this.listAmbientSounds,
  }) : super(key: key);

  final String title;
  final Duration duration;
  final Duration? intervalBellDuration;
  final String? intervalBellName;
  final String? mainMusicName;
  final bool isPremium;
  final List<Widget>? listAmbientSounds;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isPremium ? 177 : 162,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _content(context),
          _ambientSounds(),
        ],
      ),
    );
  }

  Widget _ambientSounds() {
    return Row(
      children: listAmbientSounds != null
          ? listAmbientSounds!.map((sound) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: sound,
              );
            }).toList()
          : [],
    );
  }

  Widget _content(BuildContext context) {
    var convertedDuration = duration.inMinutes.toString();
    var convertedDurationIntervalBell = intervalBellDuration?.inMinutes != null
        ? intervalBellDuration?.inMinutes.toString()
        : '';
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _premiumWidget(isPremium: isPremium),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: 250,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
              style: CustomTextStyle.WHITE_BODY_20,
            ),
          ),
          const SizedBox(height: 16),
          _textIcon(
            icon: SvgPicture.asset(AssetsPath.icClock),
            text: S.current.mins(convertedDuration),
          ),
          const SizedBox(height: 12),
          _textIcon(
            icon: SvgPicture.asset(AssetsPath.icBreak),
            text: convertedDurationIntervalBell == '0' || intervalBellName == ''
                ? ''
                : S.current.every_mins(
                    convertedDurationIntervalBell!, intervalBellName!),
          ),
          const SizedBox(height: 12),
          _textIcon(
            icon: SvgPicture.asset(AssetsPath.icMusic),
            text: mainMusicName ?? '',
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _textIcon({required Widget icon, required String text}) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyle.BODY_12,
          ),
        ),
      ],
    );
  }

  Widget _premiumWidget({required bool isPremium}) {
    return isPremium
        ? Container(
            alignment: Alignment.center,
            width: 78,
            height: 16,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              gradient: LinearGradient(
                colors: [
                  StaticColors.premium_begin_gradient,
                  StaticColors.premium_end_gradient,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetsPath.icStar),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  S.current.premium,
                  style: CustomTextStyle.WHITE_BODY_11,
                ),
              ],
            ),
          )
        : Container();
  }
}
