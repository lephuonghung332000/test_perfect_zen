import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:meditation_theme/meditation_theme.dart';
import 'package:preferences/preferences.dart';

class SoundItem extends StatefulWidget {
  final bool isSelected;
  final String text;
  final MusicDTO music;
  const SoundItem({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.music,
  }) : super(key: key);

  @override
  State<SoundItem> createState() => _SoundItemState();
}

class _SoundItemState extends State<SoundItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.text,
            style: CustomTextStyle.BODY_14.apply(
              color: _getColor(),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _buildIcon(context),
      ],
    );
  }

  Color _getColor() {
    if (!widget.music.isAssetFile) return StaticColors.item_color;
    return widget.isSelected
        ? StaticColors.purple_upgrade_plan
        : StaticColors.item_color;
  }

  Widget _buildIcon(BuildContext context) {
    if (!widget.music.isAssetFile && widget.music.filePath == null) {
      return _downloadIcon(context);
    }
    return widget.isSelected
        ? SvgPicture.asset(AssetsPath.icCheck)
        : Container();
  }

  Widget _downloadIcon(BuildContext context) {
    return BlocBuilder<DownloadMusicBloc, DownloadMusicState>(
      builder: (context, state) {
        if (state is DownloadingMusicState) {
          if (state.musicName != widget.music.name) {
            return _downloadButton(false);
          }

          final int downloadPercent = state.downloadPercent;
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              const Center(
                child: SizedBox(
                  width: 33,
                  height: 33,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: StaticColors.inside_ellipse,
                  ),
                ),
              ),
              Text(
                '$downloadPercent%',
                style: const TextStyle(fontSize: 10),
              ),
            ],
          );
        }
        if (state is SuccessDownloadMusicState) {
          if (state.musicName != widget.music.name) {
            return _downloadButton(true);
          }
          return const Icon(
            Icons.download_done,
            size: 24,
          );
        }
        if (state is FailedDownloadMusicState) {
          if (state.musicName != widget.music.name) {
            return _downloadButton(true);
          }

          return GestureDetector(
            onTap: () {
              context.read<DownloadMusicBloc>().add(StartDownloadMusicEvent(
                    music: widget.music,
                  ));
            },
            child: const Icon(
              Icons.error,
              size: 24,
            ),
          );
        }

        if (state is CancelDownloadMusicState) {
          return _downloadButton(true);
        }

        if (state is DoneDownloadMusicState) {
          BlocProvider.of<MusicBloc>(context).add(const LoadMusicEvent());

          if (state.musicName == widget.music.name) return Container();
        }

        if (state is RefreshDownloadMusicState) {
          if (state.musicName == widget.music.name) return Container();
        }

        return _downloadButton(true);
      },
    );
  }

  Widget _downloadButton(bool enable) {
    return GestureDetector(
      onTap: () {
        if (enable) {
          GetIt.I<DownloadMusicBloc>().add(
            StartDownloadMusicEvent(
              music: widget.music,
            ),
          );
        }
      },
      child: const Icon(
        Icons.download,
        size: 33,
      ),
    );
  }
}
