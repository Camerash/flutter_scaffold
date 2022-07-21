import 'package:hive_flutter/hive_flutter.dart';

const userBoxKey = 'user';

// TODO: Update to add or remove boxes
Future<void> initHive() async {
  await Hive.initFlutter();

  // Register custom types
  // Hive.registerAdapter(...);

  // Open boxes
  await Hive.openBox(userBoxKey);
}
