import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:meditation_theme/src/data/models/meditation_theme_dto.dart';
import 'action_buttons.dart';
import 'meditation_theme_info.dart';

class MeditationTheme extends StatelessWidget {
  const MeditationTheme({
    Key? key,
    required this.meditationThemeDTO,
    required this.index,
    this.keyPlayButton,
  }) : super(key: key);
  final Key? keyPlayButton;
  final MeditationThemeDTO meditationThemeDTO;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: _meditationInfo(),
            ),
            _actionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _actionButtons() {
    return ActionButtons(
      index: index,
      meditationThemeDTO: meditationThemeDTO,
      onClickMore: () {},
      onClickPlay: () {},
    );
  }

  Widget _meditationInfo() {
    return MeditationThemeInfo(
      title: meditationThemeDTO.name,
      duration: Duration(minutes: meditationThemeDTO.duration),
      intervalBellDuration:
          Duration(minutes: meditationThemeDTO.intervalBellDTO?.duration ?? 0),
      intervalBellName: meditationThemeDTO.intervalBellDTO?.musicDTO.name ?? '',
      mainMusicName: meditationThemeDTO.mainMusicDTO != null
          ? meditationThemeDTO.mainMusicDTO!.musicDTO.name
          : '',
      listAmbientSounds: meditationThemeDTO.ambientSoundsDTO != null
          ? meditationThemeDTO.ambientSoundsDTO!.listMusicDTO
              .map((e) => SvgPicture.asset(e.activeIconPath ?? ''))
              .toList()
          : [],
      isPremium: meditationThemeDTO.isPremium,
    );
  }
}
