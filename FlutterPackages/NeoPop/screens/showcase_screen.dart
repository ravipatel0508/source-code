import 'package:flutter/material.dart';

import '../widgets/pop_screen_wrapper.dart';
import 'advanced_screen.dart';
import 'buttons_screen.dart';
import 'primary_button_screen.dart';
import 'secondary_button_screen.dart';

class PopShowCase extends StatelessWidget {
  const PopShowCase({Key? key, this.initialIndex = 0}) : super(key: key);

  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: initialIndex);

    return PopScreenWrapper(
      child: PageView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        children: [
          PopButtonScreen(controller: controller),
          PopPrimaryBtnScreen(controller: controller),
          PopSecondaryBtnScreen(controller: controller),
          PopAdvancedScreen(controller: controller),
        ],
      ),
    );
  }
}
