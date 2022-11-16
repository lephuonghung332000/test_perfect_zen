// ignore_for_file: public_member_api_docs, constant_identifier_names
enum Flavor { DEV, STAGING, PROD }

// ignore: avoid_classes_with_only_static_members
class F {
  static Flavor appFlavor = Flavor.DEV;

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'Zenify Dev';
      case Flavor.STAGING:
        return 'Zenify Staging';
      case Flavor.PROD:
        return 'Zenify';
      default:
        return 'title';
    }
  }
}
