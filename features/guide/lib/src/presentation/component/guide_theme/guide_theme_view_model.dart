import '../../../../guide.dart';

class GuideThemeViewModel {
  final String image;
  final bool isPremium;
  final String time;
  final String title;

  const GuideThemeViewModel({
    required this.image,
    required this.isPremium,
    required this.time,
    required this.title,
  });

  factory GuideThemeViewModel.fromMusic(MusicEntity music) {
    return GuideThemeViewModel(
      image: music.image,
      isPremium: music.isPremium,
      time: music.time,
      title: music.title,
    );
  }
}
