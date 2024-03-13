import 'package:flutter/material.dart';
import 'package:flutter_widgets/return_nothing/nothing.dart';

class NothingWidgetExample extends StatelessWidget {
  const NothingWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    const bool hasData = false;
    return Scaffold(
      appBar: AppBar(title: const Text('Nothing')),
      body: Container(
        child: hasData
            ? const Center(
                child: Text('some text'),
              )
            : const Nothing(),
      ),
    );
  }
}
