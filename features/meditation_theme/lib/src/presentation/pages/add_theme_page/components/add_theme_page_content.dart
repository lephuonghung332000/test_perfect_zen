import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:preferences/preferences.dart';

class AddThemePageContent extends StatefulWidget {
  final Function({
    String? themeName,
    int? duration,
  }) onChanged;

  final Function({
    IntervalBellDTO? intervalBellDTO,
  }) onIntervalBellDTOChanged;

  final Function({
    MainMusicDTO? mainMusicDTO,
  }) onMainMusicDTOChanged;

  final Function({
    AmbientSoundsDTO? ambientSoundsDTO,
  }) onAmbientSoundsDTOChanged;

  final MeditationThemeDTO? meditationThemeDTO;
  final bool? isSelectedSound;
  const AddThemePageContent({
    Key? key,
    required this.onChanged,
    this.meditationThemeDTO,
    this.isSelectedSound,
    required this.onIntervalBellDTOChanged,
    required this.onMainMusicDTOChanged,
    required this.onAmbientSoundsDTOChanged,
  }) : super(key: key);

  @override
  State<AddThemePageContent> createState() => _AddThemePageContentState();
}

class _AddThemePageContentState extends State<AddThemePageContent> {
  String? themeName;
  int? duration;
  IntervalBellDTO? intervalBellDTO;
  MainMusicDTO? mainMusicDTO;
  AmbientSoundsDTO? ambientSoundsDTO;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        child: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                ThemeName(
                  initialValue: widget.meditationThemeDTO?.name,
                  onTextChange: (value) {
                    setState(() {
                      themeName = value;
                    });
                    widget.onChanged(themeName: themeName);
                  },
                ),
                ThemeDuration(
                  onChanged: (value) {
                    setState(() {
                      duration = value.toInt();
                    });
                    widget.onChanged(duration: duration);
                  },
                  initialValue: widget.meditationThemeDTO?.duration.toDouble(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  S.current.sound,
                  style: CustomTextStyle.TITLE_16_BLACK,
                ),

                Column(
                  children: [
                    _errorMessage(),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                //interval bell
                IntervalBellBody(
                  initialValue: widget.meditationThemeDTO?.intervalBellDTO,
                  onSelectMusic: (intervalBell) {
                    setState(() {
                      intervalBellDTO = intervalBell;
                    });
                    widget.onIntervalBellDTOChanged(
                        intervalBellDTO: intervalBellDTO);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // main music
                SelectMusic(
                  initialValue: widget.meditationThemeDTO?.mainMusicDTO,
                  onSelectMusic: (mainMusic) {
                    setState(() {
                      mainMusicDTO = mainMusic;
                    });
                    widget.onMainMusicDTOChanged(mainMusicDTO: mainMusicDTO);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                //ambient sounds
                AmbientSounds(
                  initialValue: widget.meditationThemeDTO?.ambientSoundsDTO,
                  isValid: widget.isSelectedSound,
                  onSelectAmbientSound: (ambientSounds) {
                    setState(() {
                      ambientSoundsDTO = ambientSounds;
                    });
                    widget.onAmbientSoundsDTOChanged(
                        ambientSoundsDTO: ambientSoundsDTO);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _errorMessage() {
    if (widget.isSelectedSound == null) return Container();
    return widget.isSelectedSound!
        ? Container()
        : Text(
            S.current.please_select_at_least_1_sound,
            style: CustomTextStyle.BODY_14.apply(
              color: Colors.red,
            ),
          );
  }
}
