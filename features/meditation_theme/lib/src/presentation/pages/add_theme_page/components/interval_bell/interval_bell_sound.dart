import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:component/atom/dropdown_menu.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:preferences/preferences.dart';

import '../../../../../../meditation_theme.dart';
import 'package:uuid/uuid.dart';

class IntervalBellSound extends StatefulWidget {
  final Function(MusicDTO?, int?) onSelectIntervalBell;
  final Function(double) onVolumeChange;
  final IntervalBellDTO? initialValue;
  const IntervalBellSound({
    Key? key,
    required this.onSelectIntervalBell,
    required this.onVolumeChange,
    this.initialValue,
  }) : super(key: key);

  @override
  State<IntervalBellSound> createState() => _IntervalBellSoundState();
}

class _IntervalBellSoundState extends State<IntervalBellSound> {
  TextEditingController selectSoundController = TextEditingController();
  MusicDTO? musicDTO;
  int? selectedIndexSound;

  late double intervalBellDuration;
  bool initialState = false;

  String? localMusicPlayerId;
  String? assetPath;
  String? currentMusicPlayerId;

  @override
  void initState() {
    super.initState();
    intervalBellDuration = 4.0;
    if (widget.initialValue != null) {
      musicDTO = widget.initialValue!.musicDTO;
      selectSoundController.text = musicDTO!.name;
      intervalBellDuration = widget.initialValue!.duration.toDouble();
    }

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<MusicBloc>(context).add(const LoadMusicEvent());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.interval_bell,
          style: CustomTextStyle.TITLE_14.apply(color: StaticColors.gray),
        ),
        const SizedBox(
          height: 20,
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            overlayShape: SliderComponentShape.noOverlay,
            trackHeight: 3,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
          ),
          child: Slider(
            divisions: 9,
            max: 10.0,
            min: 1.0,
            inactiveColor: Colors.white,
            activeColor: StaticColors.active_duration,
            label: S.current.mins(intervalBellDuration.toInt().toString()),
            onChanged: (e) {
              setState(() {
                //mins
                intervalBellDuration = e;

                if (musicDTO != null) {
                  widget.onSelectIntervalBell
                      .call(musicDTO!, intervalBellDuration.toInt());
                }
              });
            },
            value: intervalBellDuration,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        DropdownMenu(
          initialValue: musicDTO?.name,
          allowNull: true,
          errorMessage: S.current.please_select_sound,
          onTap: () {
            selectIntervalBell(initialValue: musicDTO?.name);
          },
          controller: selectSoundController,
          hint: S.current.select_sound,
        ),
        IntervalBellVolume(
          initialValue: widget.initialValue?.volume,
          onChangedVolume: (volume) {
            widget.onVolumeChange.call(volume ?? 0.0);
            if (assetPath != null) {
              setState(() {
                if (currentMusicPlayerId == null) {
                  currentMusicPlayerId = 'bell';
                  final musicPlayer =
                      AssetsAudioPlayer.withId(currentMusicPlayerId);
                  musicPlayer.open(
                    Playlist(
                      audios: [Audio(assetPath!)],
                    ),
                    loopMode: LoopMode.none,
                    autoStart: false,
                    volume: volume! / 100.0,
                    showNotification: true,
                    respectSilentMode: true,
                  );
                  musicPlayer.stop();
                  musicPlayer.setVolume(volume / 100.0);
                  musicPlayer.play();
                } else {
                  final previousMusicPlayer =
                      AssetsAudioPlayer.withId(currentMusicPlayerId);
                  previousMusicPlayer.stop();

                  final uuid = const Uuid().v4();
                  currentMusicPlayerId = uuid;
                  final nextMusicPlayer =
                      AssetsAudioPlayer.withId(currentMusicPlayerId);
                  nextMusicPlayer.open(
                    Playlist(
                      audios: [Audio(assetPath!)],
                    ),
                    loopMode: LoopMode.none,
                    autoStart: false,
                    volume: volume! / 100.0,
                    showNotification: true,
                    respectSilentMode: true,
                  );
                  nextMusicPlayer.stop();
                  nextMusicPlayer.setVolume(volume / 100.0);
                  nextMusicPlayer.play();
                }
              });
            }
          },
        ),
      ],
    );
  }

  void selectIntervalBell({String? initialValue}) {
    Size size = MediaQuery.of(context).size;
    showMaterialModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0))),
        context: context,
        builder: (context) {
          int? bottomSheetSelectedIndex = selectedIndexSound;
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setMyState) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                  color: Colors.white,
                ),
                height: size.height / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _selectIntervalBellDropDown(
                        initialValue: initialValue,
                        setLocalState: (index) {
                          setMyState(
                            () {
                              bottomSheetSelectedIndex = index;
                            },
                          );
                        },
                        bottomSheetSelectedIndex: bottomSheetSelectedIndex,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25, top: 16),
                      child: Container(
                        width: size.width - 32,
                        decoration: BoxDecoration(
                          gradient: selectedIndexSound != null
                              ? const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    StaticColors.premium_begin_gradient,
                                    StaticColors.premium_end_gradient,
                                  ],
                                )
                              : const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    StaticColors.disable_color,
                                    StaticColors.disable_color,
                                  ],
                                ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(S.current.save,
                              style: CustomTextStyle.TITLE_14.apply(
                                color: Colors.white,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  Widget _selectIntervalBellDropDown(
      {required Function(int?) setLocalState,
      required int? bottomSheetSelectedIndex,
      String? initialValue}) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          S.current.interval_bell_sound,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyle.TITLE_16.apply(color: Colors.black),
        ),
        const SizedBox(
          height: 14,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child:
                BlocBuilder<MusicBloc, MusicState>(builder: (context, state) {
              if (state is MusicLoadedState) {
                final listMusicDTO = state.listMusicDTO
                    .where(
                        (element) => element.type == MusicDtoTypes.intervalBell)
                    .toList();
                if (!initialState && widget.initialValue != null) {
                  final music = listMusicDTO
                      .firstWhere((element) => element.name == initialValue);

                  int indexInitial = listMusicDTO.indexOf(music);
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) {
                      final musicPlayer = AssetsAudioPlayer.withId(
                          listMusicDTO[indexInitial].musicPlayerId);
                      setState(() {
                        assetPath = listMusicDTO[indexInitial].assetPath;

                        selectedIndexSound = indexInitial;
                        selectSoundController.text =
                            listMusicDTO[indexInitial].name;
                        musicDTO = listMusicDTO[indexInitial];
                        setLocalState.call(indexInitial);
                        listMusicDTO[indexInitial].active = true;
                        widget.onSelectIntervalBell
                            .call(musicDTO, intervalBellDuration.toInt());
                        musicPlayer.stop();
                        initialState = true;
                      });
                    },
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() {
                          final musicPlayer = AssetsAudioPlayer.withId(
                              listMusicDTO[index].musicPlayerId);
                          localMusicPlayerId =
                              listMusicDTO[index].musicPlayerId;

                          if (selectedIndexSound != index) {
                            selectedIndexSound = index;
                            selectSoundController.text =
                                listMusicDTO[index].name;
                            musicDTO = listMusicDTO[index];
                            setLocalState.call(index);
                            listMusicDTO[index].active = true;
                            musicPlayer.play();

                            assetPath = listMusicDTO[index].assetPath;
                          } else {
                            selectedIndexSound = null;
                            selectSoundController.text = '';
                            musicDTO = null;
                            setLocalState.call(null);
                            listMusicDTO[index].active = false;
                            musicPlayer.stop();
                            assetPath = null;
                          }
                          widget.onSelectIntervalBell
                              .call(musicDTO, intervalBellDuration.toInt());
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: SoundItem(
                          music: listMusicDTO[index],
                          isSelected: index == bottomSheetSelectedIndex,
                          text: listMusicDTO[index].name,
                        ),
                      ),
                    );
                  },
                  itemCount: listMusicDTO.length,
                  separatorBuilder: (context, index) {
                    return const Divider(color: Colors.black);
                  },
                );
              }
              return Container();
            }),
          ),
        ),
      ],
    );
  }
}
