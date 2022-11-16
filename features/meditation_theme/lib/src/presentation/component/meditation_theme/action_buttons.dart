import 'package:component/atom/atom.dart';
import 'package:component/molecule/dialog/custom_dialog.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:meditation_theme/src/presentation/component/meditating/countdown_page.dart';
import 'package:meditation_theme/src/presentation/pages/edit_theme_page/edit_theme_page.dart';
import 'package:preferences/preferences.dart';
import 'package:settings/settings.dart';

import 'confirm_delete_dialog.dart';
import 'download_theme_dialog.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    Key? key,
    required this.onClickMore,
    required this.onClickPlay,
    this.keyPlayButton,
    required this.meditationThemeDTO,
    required this.index,
  }) : super(key: key);
  final Key? keyPlayButton;
  final Function onClickPlay;
  final Function onClickMore;
  final MeditationThemeDTO meditationThemeDTO;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: meditationThemeDTO.isPremium ? 180 : 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              if (state is TransactionAvailableState) {
                return _playButton(context, true);
              }
              return _playButton(context, !meditationThemeDTO.isPremium);
            },
          ),
          meditationThemeDTO.isDefault && meditationThemeDTO.isPremium
              ? Container()
              : BlocBuilder<TransactionBloc, TransactionState>(
                  builder: (context, state) {
                    if (state is TransactionAvailableState) {
                      return _moreButton(context, true);
                    }
                    return _moreButton(context, false);
                  },
                ),
        ],
      ),
    );
  }

  Widget _playButton(BuildContext context, bool haveTransaction) {
    return GestureDetector(
      onTap: () {
        GetIt.I<AnalyticsHelper>()
            .logEvent(CommontAnalyticsEvent(EventName.beginMeditation));
        onClickPlay.call();
      },
      child: !meditationThemeDTO.isDefault ||
              (meditationThemeDTO.mainMusicDTO?.musicDTO.filePath != null ||
                  meditationThemeDTO.mainMusicDTO?.musicDTO.assetPath != null)
          ? SizedBox(
              key: keyPlayButton,
              width: 56,
              height: 56,
              child: RawMaterialButton(
                onPressed: () {
                  if (haveTransaction) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CountDownPage(
                          meditationThemeDTO: meditationThemeDTO,
                        ),
                      ),
                    );
                  } else {
                    Navigator.of(context)
                        .push(
                      MaterialPageRoute(
                        builder: (context) => const SubscriptionPage(),
                      ),
                    )
                        .then(
                      (value) {
                        if (value == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CountDownPage(
                                meditationThemeDTO: meditationThemeDTO,
                              ),
                            ),
                          );
                        }
                      },
                    );
                  }
                },
                fillColor: Colors.white,
                padding: const EdgeInsets.all(20.0),
                shape: const CircleBorder(),
                child: SvgPicture.asset(AssetsPath.icPlayMusic),
              ),
            )
          : GestureDetector(
              onTap: () {
                BlocProvider.of<DownloadMusicBloc>(context)
                    .add(StartDownloadMusicEvent(
                  music: meditationThemeDTO.mainMusicDTO!.musicDTO,
                ));

                CustomDialog.showDownloadingDialog(
                  context: context,
                  body: DownloadThemeDialog(
                    onSuccess: () {
                      BlocProvider.of<MeditationThemeBloc>(context)
                          .add(const LoadMeditationThemeEvent());
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountDownPage(
                            meditationThemeDTO: meditationThemeDTO,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  right: 10,
                ),
                child: Icon(
                  Icons.download,
                  size: 24,
                ),
              ),
            ),
    );
  }

  Widget _moreButton(BuildContext context, bool haveTransaction) {
    return PopupMenuButton<int>(
      color: Colors.white,
      padding: EdgeInsets.zero,
      icon: SvgPicture.asset(
        AssetsPath.icMoreHorizontal,
        color: Colors.black,
      ),
      onSelected: (number) {
        if (number == 1) {
          haveTransaction
              ? Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditThemePage(
                      index: index,
                      meditationThemeDTO: meditationThemeDTO,
                    ),
                  ),
                )
              : Navigator.of(context)
                  .push(
                  MaterialPageRoute(
                    builder: (context) => const SubscriptionPage(),
                  ),
                )
                  .then(
                  (value) {
                    if (value == true) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditThemePage(
                            index: index,
                            meditationThemeDTO: meditationThemeDTO,
                          ),
                        ),
                      );
                    }
                  },
                );
        }
        if (number == 2) {
          haveTransaction
              ? CustomDialog.showConfirmDialog(
                  context: context,
                  title: S.current.subscription_dialog,
                  body: ConfirmDeleteDialog(
                    theme: meditationThemeDTO,
                  ),
                ).then(
                  (value) {
                    if (value is bool && value) {
                      GetIt.I<DeleteMeditationThemeBloc>().add(
                        DeleteThemeEvent(
                          onSuccess: () {
                            BlocProvider.of<MeditationThemeBloc>(context)
                                .add(const LoadMeditationThemeEvent());
                          },
                          theme: meditationThemeDTO,
                        ),
                      );
                    }
                  },
                )
              : Navigator.of(context)
                  .push(
                  MaterialPageRoute(
                    builder: (context) => const SubscriptionPage(),
                  ),
                )
                  .then((value) {
                  if (value == true) {
                    CustomDialog.showConfirmDialog(
                      context: context,
                      title: S.current.subscription_dialog,
                      body: ConfirmDeleteDialog(
                        theme: meditationThemeDTO,
                      ),
                    ).then(
                      (value) {
                        if (value is bool && value) {
                          GetIt.I<DeleteMeditationThemeBloc>().add(
                            DeleteThemeEvent(
                              onSuccess: () {
                                BlocProvider.of<MeditationThemeBloc>(context)
                                    .add(const LoadMeditationThemeEvent());
                              },
                              theme: meditationThemeDTO,
                            ),
                          );
                        }
                      },
                    );
                  }
                });
        }
      },
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      itemBuilder: (context) => [
        PopupMenuItem(
          height: 40,
          padding: const EdgeInsets.only(right: 0, left: 10),
          value: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              haveTransaction ? Container() : const PremiumIcon(),
              Row(
                children: [
                  SvgPicture.asset(AssetsPath.icEdit),
                  const SizedBox(
                    width: 14,
                  ),
                  Text(
                    S.current.edit_theme,
                    style: CustomTextStyle.TITLE_14,
                  ),
                ],
              ),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          height: 25,
          padding: const EdgeInsets.only(right: 0, left: 10),
          value: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AssetsPath.icTrash),
              const SizedBox(
                width: 14,
              ),
              Text(
                S.current.delete_theme,
                style: CustomTextStyle.TITLE_14,
              ),
            ],
          ),
        ),
      ],
      offset: const Offset(-10, -75),
    );
  }

  void downloadMusic({required MusicDTO mainMusic}) {}
}
