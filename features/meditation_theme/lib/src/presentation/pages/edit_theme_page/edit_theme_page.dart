import 'package:component/atom/custom_button.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:preferences/preferences.dart';

class EditThemePage extends StatefulWidget {
  const EditThemePage({
    Key? key,
    required this.meditationThemeDTO,
    required this.index,
  }) : super(key: key);

  final MeditationThemeDTO meditationThemeDTO;
  final int index;

  @override
  State<EditThemePage> createState() => _EditThemePageState();
}

class _EditThemePageState extends State<EditThemePage> {
  MeditationThemeDTO? meditationThemeDTO;
  GlobalKey<FormState> formKey = GlobalKey();
  bool? isSelectedSound;
  late int index;

  String? editThemeName;
  int? editDuration;
  IntervalBellDTO? editIntervalBellDTO;
  MainMusicDTO? editMainMusicDTO;
  AmbientSoundsDTO? editAmbientSoundsDTO;

  bool clicked = false;

  @override
  void initState() {
    super.initState();
    meditationThemeDTO = widget.meditationThemeDTO;
    index = widget.index;

    editThemeName = widget.meditationThemeDTO.name;
    editDuration = widget.meditationThemeDTO.duration;
    editIntervalBellDTO = widget.meditationThemeDTO.intervalBellDTO;
    editMainMusicDTO = widget.meditationThemeDTO.mainMusicDTO;
    editAmbientSoundsDTO = widget.meditationThemeDTO.ambientSoundsDTO;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<MusicBloc>(context).add(const LoadMusicEvent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          color: StaticColors.add_theme_background_purple,
          child: Center(
            child: AddThemePageBody(
              headerTitle: S.current.edit_theme,
              meditationThemeDTO: meditationThemeDTO!,
              onIntervalBellDTOChanged: ({
                IntervalBellDTO? intervalBellDTO,
              }) {
                setState(() {
                  editIntervalBellDTO = intervalBellDTO;
                  if (clicked) isSelectedSound = checkValidateSound();
                });
                updateTheme();
              },
              onMainMusicDTOChanged: ({
                MainMusicDTO? mainMusicDTO,
              }) {
                setState(() {
                  editMainMusicDTO = mainMusicDTO;
                  if (clicked) isSelectedSound = checkValidateSound();
                });
                updateTheme();
              },
              onAmbientSoundsDTOChanged: ({
                AmbientSoundsDTO? ambientSoundsDTO,
              }) {
                setState(() {
                  editAmbientSoundsDTO = ambientSoundsDTO;
                  if (clicked) isSelectedSound = checkValidateSound();
                });
                updateTheme();
              },
              isSelectedSound: isSelectedSound,
              onChanged: ({
                String? themeName,
                int? duration,
              }) {
                setState(() {
                  if (themeName != editThemeName && clicked) {
                    formKey.currentState!.validate();
                  }
                  if (themeName != null) editThemeName = themeName;

                  if (duration != null) editDuration = duration;
                });

                updateTheme();
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: StaticColors.add_theme_background_purple,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8,
            bottom: 25,
          ),
          child: CustomButton(
            onClick: () {
              setState(() {
                clicked = true;
              });
              bool formValid =
                  formKey.currentState!.validate() && checkValidateSound();
              if (formValid && meditationThemeDTO != null) {
                GetIt.I<EditMeditationThemeBloc>().add(
                  EditMeditationThemeEvent(
                    originalMeditationThemeDTO: widget.meditationThemeDTO,
                    editedMeditationThemeDTO: meditationThemeDTO!,
                    onSuccess: () {
                      setState(() {
                        isSelectedSound = true;
                      });
                      BlocProvider.of<MeditationThemeBloc>(context)
                          .add(const LoadMeditationThemeEvent());
                      Routes.pop();
                    },
                  ),
                );
              } else {
                setState(() {
                  isSelectedSound = checkValidateSound();
                });
              }
            },
            name: S.current.save_theme,
          ),
        ),
      ),
    );
  }

  bool validate(BuildContext context) {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      Keyboard.hide(context);
    }
    return isValid;
  }

  bool checkValidateSound() {
    if (editIntervalBellDTO != null) return true;
    if (editMainMusicDTO != null) return true;
    if (editAmbientSoundsDTO != null &&
        editAmbientSoundsDTO!.listMusicDTO.isNotEmpty) return true;
    return false;
  }

  void updateTheme() {
    if (checkValidateSound() && editThemeName != null) {
      setState(() {
        meditationThemeDTO = MeditationThemeDTO(
          isPremium: widget.meditationThemeDTO.isPremium,
          name: editThemeName ?? widget.meditationThemeDTO.name,
          duration: editDuration ?? widget.meditationThemeDTO.duration,
          intervalBellDTO: editIntervalBellDTO,
          mainMusicDTO: editMainMusicDTO,
          ambientSoundsDTO: editAmbientSoundsDTO,
          createdAt: meditationThemeDTO!.createdAt,
          updatedAt: DateTime.now(),
          isDefault: false,
        );
      });
    }
  }
}
