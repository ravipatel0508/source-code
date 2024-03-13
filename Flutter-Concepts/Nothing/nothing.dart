import 'package:flutter/widgets.dart';

class Nothing extends Widget {
  const Nothing({Key? key}) : super(key: key);

  @override
  Element createElement() => _NilElement(this);
}

class _NilElement extends Element {
  _NilElement(Nothing widget) : super(widget);

  @override
  void mount(Element? parent, dynamic newSlot) {
    assert(parent is! MultiChildRenderObjectElement, "You are using Nothing under a MultiChildRenderObjectElement.");
    super.mount(parent, newSlot);
  }

  @override
  bool get debugDoingBuild => false;

  @override
  void performRebuild() {}
}
