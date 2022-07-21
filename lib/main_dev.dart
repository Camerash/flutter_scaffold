import 'package:flutter_scaffold/app/app.dart';
import 'package:flutter_scaffold/bootstrap.dart';
import 'package:flutter_scaffold/flavor.dart';

void main() {
  F.appFlavor = Flavor.dev;
  bootstrap(() => const App());
}
