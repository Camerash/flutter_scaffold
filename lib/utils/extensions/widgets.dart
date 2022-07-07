import 'package:flutter/material.dart';

extension ListWidget on List<Widget> {
  List<Widget> intersperse(Widget element) {
    return intersperseCore(element, this).toList();
  }
}

Iterable<T> intersperseCore<T>(T element, Iterable<T> iterable) sync* {
  final iterator = iterable.iterator;
  if (iterator.moveNext()) {
    yield iterator.current;
    while (iterator.moveNext()) {
      yield element;
      yield iterator.current;
    }
  }
}
