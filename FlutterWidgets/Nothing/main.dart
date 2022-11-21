import 'package:flutter/material.dart';
import 'package:flutter_widgets/return_nothing/nothing.dart';

class NothingWidget extends StatelessWidget {
  const NothingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const bool hasData = false;
    return Scaffold(
      appBar: AppBar(title: const Text('Nothing')),
      body: hasData
          ? const Center(
              child: Text('some text'),
            )
          : const Nothing(),
    );
  }
}
