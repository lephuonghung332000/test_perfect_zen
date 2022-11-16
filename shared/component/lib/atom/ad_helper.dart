import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

class AdHelper {
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  int maxFailedLoadAttempts = 5;
  final logger = GetIt.I<Logger>();
  final globalConfig = GetIt.I<GlobalConfiguration>();

  String? get adUnitId {
    final adsInterstitialIOS =
        globalConfig.getValue<String?>('ads_interstitial_ios');
    final adsInterstitialAndroid =
        globalConfig.getValue<String?>('ads_interstitial_android');
    return Platform.isAndroid ? adsInterstitialAndroid : adsInterstitialIOS;
  }

  AdHelper() {
    if (kDebugMode) {
      MobileAds.instance.updateRequestConfiguration(RequestConfiguration(
        testDeviceIds: [
          '015da11d18cb5c3794ceb7bcf2315f09',
          '49417D68CD9645197D80AA8015438837',
          '488AF3E1AD5B7EF1E117952109552085'
        ],
      ));
    }
  }

  void createInterstitialAd() {
    if (adUnitId == null) {
      return;
    }

    InterstitialAd.load(
      adUnitId: adUnitId!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          logger.i('$ad loaded');
          _interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          _interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          logger.e('InterstitialAd failed to load: $error.');
          _numInterstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
            createInterstitialAd();
          }
        },
      ),
    );
  }

  void showInterstitialAd({VoidCallback? onDimissed}) {
    if (_interstitialAd == null) {
      logger.w('Warning: attempt to show interstitial before loaded.');
      onDimissed?.call();
      return;
    }

    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          logger.d('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        logger.d('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        onDimissed?.call();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        logger.e('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createInterstitialAd();
        onDimissed?.call();
      },
    );

    _interstitialAd!.show();
    _interstitialAd = null;
  }
}
