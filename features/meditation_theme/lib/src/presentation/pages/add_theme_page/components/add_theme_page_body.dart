import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:meditation_theme/meditation_theme.dart';

class AddThemePageBody extends StatefulWidget {
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
  final String? headerTitle;
  final bool? isSelectedSound;
  const AddThemePageBody({
    Key? key,
    required this.onChanged,
    this.meditationThemeDTO,
    this.headerTitle,
    this.isSelectedSound,
    required this.onIntervalBellDTOChanged,
    required this.onMainMusicDTOChanged,
    required this.onAmbientSoundsDTOChanged,
  }) : super(key: key);

  @override
  State<AddThemePageBody> createState() => _AddThemePageBodyState();
}

class _AddThemePageBodyState extends State<AddThemePageBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          AddThemePageHeader(
            content: widget.headerTitle,
            onBack: () {
              BlocProvider.of<MeditationThemeBloc>(context)
                  .add(const LoadMeditationThemeEvent());
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AddThemePageContent(
            onIntervalBellDTOChanged: ({
              IntervalBellDTO? intervalBellDTO,
            }) {
              widget.onIntervalBellDTOChanged.call(
                intervalBellDTO: intervalBellDTO,
              );
            },
            onMainMusicDTOChanged: ({
              MainMusicDTO? mainMusicDTO,
            }) {
              widget.onMainMusicDTOChanged.call(
                mainMusicDTO: mainMusicDTO,
              );
            },
            onAmbientSoundsDTOChanged: ({
              AmbientSoundsDTO? ambientSoundsDTO,
            }) {
              widget.onAmbientSoundsDTOChanged.call(
                ambientSoundsDTO: ambientSoundsDTO,
              );
            },
            meditationThemeDTO: widget.meditationThemeDTO,
            isSelectedSound: widget.isSelectedSound,
            onChanged: ({
              String? themeName,
              int? duration,
            }) {
              widget.onChanged.call(
                themeName: themeName,
                duration: duration,
              );
            },
          ),
        ],
      ),
    );
  }
}
