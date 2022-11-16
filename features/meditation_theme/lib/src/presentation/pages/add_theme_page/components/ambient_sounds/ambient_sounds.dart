import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:component/atom/custom_slider.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:preferences/preferences.dart';

class AmbientSounds extends StatefulWidget {
  final Function(AmbientSoundsDTO?) onSelectAmbientSound;
  final bool? isValid;
  final AmbientSoundsDTO? initialValue;
  const AmbientSounds({
    Key? key,
    required this.onSelectAmbientSound,
    this.isValid,
    this.initialValue,
  }) : super(key: key);

  @override
  State<AmbientSounds> createState() => _AmbientSoundsState();
}

class _AmbientSoundsState extends State<AmbientSounds> {
  double ambientSoundsValue = 5.0;
  List<MusicDTO> listSelectedAmbientSound = [];
  bool initialState = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      ambientSoundsValue = widget.initialValue!.volume.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          S.current.ambient_sounds,
          style: CustomTextStyle.TITLE_14.apply(
            color: StaticColors.gray,
          ),
        ),
        BlocBuilder<MusicBloc, MusicState>(
          builder: (context, state) {
            if (state is MusicLoadedState) {
              final listMusicDTO = state.listMusicDTO
                  .where(
                      (element) => element.type == MusicDtoTypes.ambientSound)
                  .toList();

              if (!initialState && widget.initialValue != null) {
                List<String> listName = widget.initialValue!.listMusicDTO
                    .map((e) => e.name)
                    .toList();
                listMusicDTO.forEach((element) {
                  bool isExist = listName.contains(element.name);
                  if (isExist) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (_) {
                        setState(() {
                          element.active = true;
                          listSelectedAmbientSound.add(element);
                          final musicPlayer =
                              AssetsAudioPlayer.withId(element.musicPlayerId);
                          musicPlayer.stop();
                        });

                        initialState = true;
                      },
                    );
                  }
                });
              } else {
                final activeMusics =
                    listMusicDTO.where((element) => element.active);
                for (final music in activeMusics) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) {
                      setState(() {
                        music.active == false;
                      });
                    },
                  );
                }
              }
              return GridView.count(
                crossAxisCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                mainAxisSpacing: 45,
                crossAxisSpacing: 100,
                children: listMusicDTO.map((music) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (listSelectedAmbientSound.isNotEmpty) {
                      listSelectedAmbientSound.forEach((element) {
                        if (element.active == false) {
                          setState(() {
                            element.active = true;
                          });
                        }
                      });
                    }
                  });

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        music.active = !music.active;
                        final musicPlayer =
                            AssetsAudioPlayer.withId(music.musicPlayerId);

                        if (music.active) {
                          listSelectedAmbientSound.add(music);
                          musicPlayer.play();
                        } else {
                          musicPlayer.stop();
                          listSelectedAmbientSound.removeWhere((element) =>
                              element.name == music.name &&
                              element.filePath == music.filePath);
                        }
                        widget.onSelectAmbientSound
                            .call(listSelectedAmbientSound.isEmpty
                                ? null
                                : AmbientSoundsDTO(
                                    listMusicDTO: listSelectedAmbientSound,
                                    volume: ambientSoundsValue,
                                  ));
                      });
                    },
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(
                        music.active ? music.activeIconPath! : music.iconPath!,
                      ),
                    ),
                  );
                }).toList(),
              );
            }
            return Container();
          },
        ),
        const SizedBox(
          height: 30,
        ),
        CustomSlider(
          value: ambientSoundsValue,
          onChanged: (value) {
            setState(() {
              ambientSoundsValue = value;

              if (listSelectedAmbientSound.isNotEmpty) {
                for (final sound in listSelectedAmbientSound) {
                  final musicPlayer =
                      AssetsAudioPlayer.withId(sound.musicPlayerId);
                  musicPlayer.setVolume(ambientSoundsValue / 100.0);
                }
                widget.onSelectAmbientSound.call(AmbientSoundsDTO(
                  listMusicDTO: listSelectedAmbientSound,
                  volume: ambientSoundsValue,
                ));
              }
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget validate() {
    if (widget.isValid != null) {
      return listSelectedAmbientSound.isNotEmpty
          ? Container()
          : Text(
              S.current.please_select_ambient_sounds,
              style: CustomTextStyle.BODY_14.apply(
                color: Colors.red,
              ),
            );
    }
    return Container();
  }
}
