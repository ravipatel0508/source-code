import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neopop/neopop.dart';
import 'package:package_example/neopop_design/utils/page_controller_extension.dart';

import '../utils/constants.dart';
import '../widgets/bottom_nav_widget.dart';

class PopButtonScreen extends StatefulWidget {
  const PopButtonScreen({Key? key, required this.controller}) : super(key: key);

  final PageController controller;

  @override
  State<PopButtonScreen> createState() => _PopButtonScreenState();
}

class _PopButtonScreenState extends State<PopButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          const Expanded(flex: 5, child: SizedBox()),
          SvgPicture.asset('assets/neopop_assets/svg/heading_buttons.svg'),
          const Expanded(flex: 4, child: SizedBox()),
          SvgPicture.asset(
              'assets/neopop_assets/svg/text_floating_tilted_button.svg'),
          const SizedBox(height: 15),
          NeoPopTiltedButton(
            isFloating: true,
            onTapUp: () => HapticFeedback.lightImpact(),
            onTapDown: () => HapticFeedback.lightImpact(),
            decoration: const NeoPopTiltedButtonDecoration(
              color: kPopYellowColor,
              plunkColor: kPlunkColorYellow,
              shadowColor: kTiltedButtonShadowColor,
              showShimmer: true,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70.0,
                vertical: 15,
              ),
              child: SvgPicture.asset(
                  'assets/neopop_assets/svg/cta_text_play_now.svg'),
            ),
          ),
          const Expanded(child: SizedBox()),
          SvgPicture.asset(
              'assets/neopop_assets/svg/text_non_floating_tilt_button.svg'),
          const SizedBox(height: 15),
          NeoPopTiltedButton(
            color: kPrimaryButtonColor,
            onTapUp: () => HapticFeedback.lightImpact(),
            onTapDown: () => HapticFeedback.lightImpact(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80.0,
                vertical: 15,
              ),
              child: SvgPicture.asset(
                  'assets/neopop_assets/svg/cta_text_view.svg'),
            ),
          ),
          const Expanded(child: SizedBox()),
          SvgPicture.asset('assets/neopop_assets/svg/text_stroke_button.svg'),
          const SizedBox(height: 18),
          NeoPopButton(
            color: kSecondaryButtonLightColor,
            bottomShadowColor: kShadowColorDarkGreen,
            rightShadowColor: kShadowColorGreen,
            animationDuration: kButtonAnimationDuration,
            depth: kButtonDepth,
            onTapUp: () => HapticFeedback.lightImpact(),
            onTapDown: () => HapticFeedback.lightImpact(),
            border: Border.all(
              color: kBorderColorGreen,
              width: kButtonBorderWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 15,
              ),
              child: SvgPicture.asset(
                  'assets/neopop_assets/svg/cta_text_scan.svg'),
            ),
          ),
          const Expanded(flex: 4, child: SizedBox()),
          BottomNavWidget(
            onLeftTap: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
            onRightTap: () => widget.controller.slideToNextPage(),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
