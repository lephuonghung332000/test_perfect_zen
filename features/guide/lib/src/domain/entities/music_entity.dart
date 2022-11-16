import 'package:dependencies/dependencies.dart';
import 'package:preferences/preferences.dart';

class MusicEntity extends Equatable {
  final String image;
  final String title;
  final String url;
  final String time;
  final bool isPremium;
  const MusicEntity({
    required this.title,
    required this.image,
    required this.url,
    required this.isPremium,
    required this.time,
  });

  @override
  List<Object> get props => [title, image, url, time, isPremium];

  static List<MusicEntity> mocks() {
    return const [
      MusicEntity(
        image: AssetsPath.imgGuideMeditation,
        title: "'How to Meditate' for Beginners | Sadhguru",
        time: "12:48",
        url: AssetsPath.howToMeditateForBeginners,
        isPremium: false,
      ),
      MusicEntity(
        image: AssetsPath.imgGuideStep,
        title: "Calm - Ease | Guided Meditation by Thich Nhat Hanh",
        time: "20:24",
        url: AssetsPath.calmEaseGuidedMeditationByThichNhatHanh,
        isPremium: false,
      ),
      MusicEntity(
        image: AssetsPath.imgGuideBeginning,
        title: "5 Minute Guided Morning Meditation for Positive Energy",
        time: "5:32",
        url: AssetsPath.minuteGuidedMorningMeditationForPositiveEnergy,
        isPremium: true,
      ),
      MusicEntity(
        image: AssetsPath.imgGuideAdvancedTechniques,
        title: "5-Minute Guided Meditation: Morning Energy | SEL",
        time: "4:46",
        url: AssetsPath.minuteGuidedMeditationMorningEnergy,
        isPremium: true,
      ),
      MusicEntity(
        image: AssetsPath.imgGuideJump,
        title: "15 Min Guided Meditation For Healing & Recovery",
        time: "15:48",
        url: AssetsPath.min15GuidedMeditationForHealingRecovery,
        isPremium: true,
      ),
      MusicEntity(
        image: AssetsPath.imgGuideMeditationForBeginers,
        title:
            "Connect to HIGHER SELF Guided Meditation | Hypnosis for Meeting your Higher Self",
        time: "59:51",
        url: AssetsPath.connectToHigherSelfGuidedMeditation,
        isPremium: true,
      ),
    ];
  }
}
