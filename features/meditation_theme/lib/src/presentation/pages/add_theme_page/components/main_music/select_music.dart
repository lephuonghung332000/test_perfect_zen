import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:component/atom/custom_slider.dart';
import 'package:component/atom/dropdown_menu.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:preferences/preferences.dart';
import 'package:settings/settings.dart';

class SelectMusic extends StatefulWidget {
  final Function(MainMusicDTO?) onSelectMusic;
  final MainMusicDTO? initialValue;
  const SelectMusic({
    Key? key,
    required this.onSelectMusic,
    this.initialValue,
  }) : super(key: key);

  @override
  State<SelectMusic> createState() => _SelectMusicState();
}

class _SelectMusicState extends State<SelectMusic> {
  TextEditingController selectMusicController = TextEditingController();
  MusicDTO? musicDTO;
  int? selectedIndexMusic;

  double musicValue = 5;
  bool initialState = false;
  String? localMusicPlayerId;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      musicDTO = widget.initialValue?.musicDTO;
      selectMusicController.text = musicDTO!.name;
      musicValue = widget.initialValue!.volume.toDouble();
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
          S.current.music,
          style: CustomTextStyle.TITLE_14.apply(color: StaticColors.gray),
        ),
        const SizedBox(
          height: 20,
        ),
        DropdownMenu(
          key: MeditationKey.meditationDropDownTimerKey,
          initialValue: musicDTO?.name,
          allowNull: true,
          errorMessage: S.current.please_select_music,
          onTap: () {
            selectMusic(initialValue: musicDTO?.name);
          },
          controller: selectMusicController,
          hint: S.current.select_music,
        ),
        CustomSlider(
          value: musicValue,
          onChanged: (value) {
            setState(() {
              if (localMusicPlayerId != null) {
                final currentMusicPlayer =
                    AssetsAudioPlayer.withId(localMusicPlayerId);
                currentMusicPlayer.setVolume(value / 100.0);
              }

              musicValue = value;
              if (musicDTO != null) {
                widget.onSelectMusic.call(
                  MainMusicDTO(musicDTO: musicDTO!, volume: musicValue),
                );
              }
            });
          },
        ),
      ],
    );
  }

  void selectMusic({String? initialValue}) {
    Size size = MediaQuery.of(context).size;

    showMaterialModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0))),
        context: context,
        builder: (context) {
          int? bottomSheetSelectedIndex = selectedIndexMusic;
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
                      child: _selectMusicDropDown(
                          initialValue: initialValue,
                          setLocalState: (index) {
                            setMyState(
                              () {
                                bottomSheetSelectedIndex = index;
                              },
                            );
                          },
                          bottomSheetSelectedIndex: bottomSheetSelectedIndex),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25, top: 16),
                      child: Container(
                        width: size.width - 32,
                        decoration: BoxDecoration(
                          gradient: selectedIndexMusic != null
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
                          key: MeditationKey.meditationSaveMusicTimerKey,
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

  Widget _selectMusicDropDown({
    required Function(int?) setLocalState,
    required int? bottomSheetSelectedIndex,
    String? initialValue,
  }) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          S.current.music,
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
                    .where((element) => element.type == MusicDtoTypes.mainMusic)
                    .toList();

                if (!initialState && initialValue != null) {
                  final music = listMusicDTO
                      .firstWhere((element) => element.name == initialValue);

                  int indexInitial = listMusicDTO.indexOf(music);
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) {
                      final musicPlayer = AssetsAudioPlayer.withId(
                          listMusicDTO[indexInitial].musicPlayerId);

                      setState(() {
                        localMusicPlayerId =
                            listMusicDTO[indexInitial].musicPlayerId;

                        selectMusicController.text =
                            listMusicDTO[indexInitial].name;
                        selectedIndexMusic = indexInitial;
                        musicDTO = listMusicDTO[indexInitial];
                        setLocalState.call(indexInitial);
                        listMusicDTO[indexInitial].active = true;
                        musicPlayer.stop();

                        widget.onSelectMusic.call(
                          MainMusicDTO(
                              musicDTO: listMusicDTO[indexInitial],
                              volume: musicValue),
                        );
                        initialState = true;
                      });
                    },
                  );
                }

                return ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return listMusicDTO.length == index
                        ? addMusicOrUpgradeMessage()
                        : GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              if (listMusicDTO[index].isAssetFile ||
                                  listMusicDTO[index].filePath != null) {
                                setState(() {
                                  for (final music in listMusicDTO) {
                                    final musicPlayer =
                                        AssetsAudioPlayer.withId(
                                            music.musicPlayerId);
                                    if (music.active) {
                                      musicPlayer.stop();
                                    }
                                  }

                                  final musicPlayer = AssetsAudioPlayer.withId(
                                      listMusicDTO[index].musicPlayerId);

                                  localMusicPlayerId =
                                      listMusicDTO[index].musicPlayerId;

                                  if (selectedIndexMusic != index) {
                                    selectMusicController.text =
                                        listMusicDTO[index].name;
                                    selectedIndexMusic = index;
                                    musicDTO = listMusicDTO[index];

                                    setLocalState.call(index);
                                    listMusicDTO[index].active = true;
                                    musicPlayer.play();
                                  } else {
                                    selectedIndexMusic = null;
                                    selectMusicController.text = '';
                                    musicDTO = null;

                                    setLocalState.call(null);
                                    listMusicDTO[index].active = false;
                                    musicPlayer.stop();
                                  }
                                  widget.onSelectMusic.call(
                                    musicDTO == null
                                        ? null
                                        : MainMusicDTO(
                                            musicDTO: musicDTO!,
                                            volume: musicValue),
                                  );
                                });
                              }
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: SoundItem(
                                  music: listMusicDTO[index],
                                  isSelected: index == bottomSheetSelectedIndex,
                                  text: listMusicDTO[index].name,
                                )),
                          );
                  },
                  itemCount: listMusicDTO.length + 1,
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

  Widget addMusicOrUpgradeMessage() {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        if (state is TransactionAvailableState) {
          return GestureDetector(
            onTap: () {
              GetIt.I<AnalyticsHelper>().logEvent(
                  CommontAnalyticsEvent(EventName.selectAddMoreMusic));
              context.read<MusicBloc>().add(
                    AddAudioEvent(),
                  );
            },
            child: Row(
              children: [
                SvgPicture.asset(AssetsPath.icPlusAddMusic),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  S.current.add_music_from_device,
                  style: CustomTextStyle.TITLE_14.apply(
                    color: StaticColors.purple_upgrade_plan,
                  ),
                ),
              ],
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.upgrade_message,
              style: CustomTextStyle.BODY_12.apply(color: Colors.grey),
            ),
            const SizedBox(
              height: 4,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SubscriptionPage(),
                  ),
                ).then((value) {
                  GestureDetector(
                    onTap: () {
                      GetIt.I<AnalyticsHelper>().logEvent(
                          CommontAnalyticsEvent(EventName.selectAddMoreMusic));
                      context.read<MusicBloc>().add(
                            AddAudioEvent(),
                          );
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(AssetsPath.icPlusAddMusic),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          S.current.add_music_from_device,
                          style: CustomTextStyle.TITLE_14.apply(
                            color: StaticColors.purple_upgrade_plan,
                          ),
                        ),
                      ],
                    ),
                  );
                });
              },
              child: Row(
                children: [
                  Text(
                    S.current.upgrade_now,
                    style: CustomTextStyle.TITLE_14.apply(
                      color: StaticColors.purple_upgrade_plan,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  SvgPicture.asset(AssetsPath.icArrowRight),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
