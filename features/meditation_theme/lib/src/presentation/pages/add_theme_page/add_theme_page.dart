import 'dart:core';

import 'package:component/atom/custom_button.dart';
import 'package:component/component.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:meditation_theme/src/presentation/blocs/create_meditation_theme_bloc/create_meditation_theme_event.dart';
import 'package:preferences/preferences.dart';

import '../../../analytics/analytics.dart';

class AddThemePage extends StatefulWidget {
  const AddThemePage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddThemePage> createState() => _AddThemePageState();
}

class _AddThemePageState extends State<AddThemePage> {
  MeditationThemeDTO? meditationThemeDTO;
  GlobalKey<FormState> formKey = GlobalKey();
  bool? isSelectedSound;

  String? meditationThemeThemeName;
  int? meditationThemeDuration;
  IntervalBellDTO? meditationThemeIntervalBellDTO;
  MainMusicDTO? meditationThemeMainMusicDTO;
  AmbientSoundsDTO? meditationThemeAmbientSoundsDTO;

  bool clicked = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<MusicBloc>(context).add(const LoadMusicEvent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GetIt.I<AnalyticsHelper>().setCurrentScreen(ScreenName.addThemeScreen);
    return GestureDetector(
      onTap: () {
        Keyboard.hide(context);
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Container(
            color: StaticColors.add_theme_background_purple,
            child: Center(
              child: AddThemePageBody(
                onIntervalBellDTOChanged: ({
                  IntervalBellDTO? intervalBellDTO,
                }) {
                  setState(() {
                    meditationThemeIntervalBellDTO = intervalBellDTO;
                    if (clicked) isSelectedSound = checkValidateSound();
                  });
                  _newMeditationThemeDTO();
                },
                onMainMusicDTOChanged: ({
                  MainMusicDTO? mainMusicDTO,
                }) {
                  setState(() {
                    meditationThemeMainMusicDTO = mainMusicDTO;
                    if (clicked) isSelectedSound = checkValidateSound();
                  });
                  _newMeditationThemeDTO();
                },
                onAmbientSoundsDTOChanged: ({
                  AmbientSoundsDTO? ambientSoundsDTO,
                }) {
                  setState(() {
                    meditationThemeAmbientSoundsDTO = ambientSoundsDTO;
                    if (clicked) isSelectedSound = checkValidateSound();
                  });
                  _newMeditationThemeDTO();
                },
                isSelectedSound: isSelectedSound,
                onChanged: ({
                  String? themeName,
                  int? duration,
                }) {
                  setState(() {
                    if (themeName != meditationThemeThemeName && clicked) {
                      formKey.currentState!.validate();
                    }
                    if (themeName != null) meditationThemeThemeName = themeName;

                    if (duration != null) {
                      GetIt.I<AnalyticsHelper>().logEvent(CommontAnalyticsEvent(
                          EventName.selectMeditationDuration));
                      meditationThemeDuration = duration;
                    }
                  });
                  _newMeditationThemeDTO();
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
              key: MeditationKey.meditationSaveTimerKey,
              onClick: () {
                setState(() {
                  clicked = true;
                });
                bool formValid =
                    formKey.currentState!.validate() && checkValidateSound();
                if (formValid && meditationThemeDTO != null) {
                  GetIt.I<CreateMeditationThemeBloc>().add(
                    CreateMeditationThemeEvent(
                      meditationThemeDTO: meditationThemeDTO!,
                      onSuccess: () {
                        if (meditationThemeDTO!.intervalBellDTO != null) {
                          GetIt.I<AnalyticsHelper>().logEvent(
                              SelectIntervalBellEvent(meditationThemeDTO!
                                  .intervalBellDTO!.musicDTO.name));
                        }
                        if (meditationThemeDTO!.mainMusicDTO != null) {
                          GetIt.I<AnalyticsHelper>().logEvent(
                              SelectMusicThemeEvent(meditationThemeDTO!
                                  .mainMusicDTO!.musicDTO.name));
                        }

                        final ambients = meditationThemeDTO!
                            .ambientSoundsDTO?.listMusicDTO
                            .map((e) => e.name)
                            .map((e) => SelectAmbientEvent(e))
                            .toList();
                        if (ambients != null) {
                          GetIt.I<AnalyticsHelper>().logEvents(ambients);
                        }

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
    if (meditationThemeIntervalBellDTO != null) return true;
    if (meditationThemeMainMusicDTO != null) return true;
    if (meditationThemeAmbientSoundsDTO != null &&
        meditationThemeAmbientSoundsDTO!.listMusicDTO.isNotEmpty) return true;
    return false;
  }

  void _newMeditationThemeDTO() {
    if (checkValidateSound() && meditationThemeThemeName != null) {
      final now = DateTime.now();
      setState(() {
        meditationThemeDTO = MeditationThemeDTO(
          name: meditationThemeThemeName!,
          duration: meditationThemeDuration ?? 15,
          intervalBellDTO: meditationThemeIntervalBellDTO,
          mainMusicDTO: meditationThemeMainMusicDTO,
          ambientSoundsDTO: meditationThemeAmbientSoundsDTO,
          createdAt: now,
          updatedAt: now,
          isDefault: false,
          isPremium: false,
        );
      });
    }
  }
}
