import 'dart:io';

import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class AdBanner extends StatefulWidget {
  const AdBanner({super.key});

  @override
  State<StatefulWidget> createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  BannerAd? adBanner;

  final globalConfig = GetIt.I<GlobalConfiguration>();

  String? get adBannerId {
    final adBannerIOS = globalConfig.getValue<String?>('ads_banner_ios');
    final adBannerAndroid =
        globalConfig.getValue<String?>('ads_banner_android');
    return Platform.isAndroid ? adBannerAndroid : adBannerIOS;
  }

  @override
  void initState() {
    super.initState();

    adBanner = BannerAd(
      size: AdSize.banner,
      adUnitId: adBannerId!,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {},
        onAdFailedToLoad: (ad, error) {},
      ),
    );

    if (adBanner != null) {
      adBanner!.load();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (adBanner == null) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: AdSize.banner.height.toDouble(),
      width: MediaQuery.of(context).size.width,
      child: AdWidget(ad: adBanner!),
    );
  }
}
