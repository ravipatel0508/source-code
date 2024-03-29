import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neopop/neopop.dart';
import 'package:package_example/neopop_design/utils/page_controller_extension.dart';

import '../utils/constants.dart';
import '../widgets/bottom_nav_widget.dart';

class PopSecondaryBtnScreen extends StatelessWidget {
  const PopSecondaryBtnScreen({Key? key, required this.controller})
      : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(flex: 7, child: SizedBox()),
        SvgPicture.asset('assets/neopop_assets/svg/heading_secondary_btns.svg'),
        const Expanded(flex: 8, child: SizedBox()),
        NeoPopButton(
          color: kSecondaryButtonColor,
          parentColor: kSecondaryButtonLightColor,
          depth: kButtonDepth,
          animationDuration: kButtonAnimationDuration,
          buttonPosition: Position.center,
          onTapUp: () => HapticFeedback.lightImpact(),
          onTapDown: () => HapticFeedback.lightImpact(),
          border: const Border.fromBorderSide(
            BorderSide(color: kBorderColorWhite, width: kButtonBorderWidth),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            child: SvgPicture.asset(
                'assets/neopop_assets/svg/cta_text_secondary.svg'),
          ),
        ),
        const Expanded(flex: 2, child: SizedBox()),
        NeoPopButton(
          color: kSecondaryButtonLightColor,
          rightShadowColor: kShadowColorLightGrey,
          bottomShadowColor: kShadowColorGrey,
          depth: kButtonDepth,
          animationDuration: kButtonAnimationDuration,
          buttonPosition: Position.fullBottom,
          onTapUp: () => HapticFeedback.lightImpact(),
          onTapDown: () => HapticFeedback.lightImpact(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            child: SvgPicture.asset(
                'assets/neopop_assets/svg/cta_text_secondary.svg'),
          ),
        ),
        const Expanded(flex: 2, child: SizedBox()),
        NeoPopButton(
          color: kSecondaryButtonColor,
          parentColor: kSecondaryButtonLightColor,
          depth: kButtonDepth,
          animationDuration: kButtonAnimationDuration,
          buttonPosition: Position.center,
          onTapUp: () => HapticFeedback.lightImpact(),
          onTapDown: () => HapticFeedback.lightImpact(),
          border: const Border.fromBorderSide(
            BorderSide(color: kBorderColorWhite, width: kButtonBorderWidth),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            child: SvgPicture.asset(
                'assets/neopop_assets/svg/cta_text_secondary.svg'),
          ),
        ),
        const Expanded(flex: 10, child: SizedBox()),
        BottomNavWidget(
          onLeftTap: () => controller.slideToPrevPage(),
          onRightTap: () => controller.slideToNextPage(),
        ),
        const Expanded(flex: 2, child: SizedBox()),
      ],
    );
  }
}
