// ignore_for_file: avoid_classes_with_only_static_members

enum Flavor { dev, prod }

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';
}
