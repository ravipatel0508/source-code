import 'package:flutter/material.dart';

class Nothing extends Widget {
  const Nothing({super.key});

  @override
  Element createElement() => _NothingElement(this);
}

class _NothingElement extends Element {
  _NothingElement(super.widget);

  @override
  bool get debugDoingBuild => false;

  @override
  void performRebuild() {}
}
