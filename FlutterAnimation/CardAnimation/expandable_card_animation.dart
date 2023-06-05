import 'package:flutter/material.dart';

class ExpandableCardAnimationExample extends StatefulWidget {
  const ExpandableCardAnimationExample({super.key});

  @override
  State<ExpandableCardAnimationExample> createState() =>
      _ExpandableCardAnimationExampleState();
}

class _ExpandableCardAnimationExampleState
    extends State<ExpandableCardAnimationExample> {
  bool isTapped = true;
  bool isExpanded = false;
  bool isAnimationCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expandable Card Animation'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  isTapped = !isTapped;
                });
              },
              onHighlightChanged: (value) {
                setState(() {
                  isExpanded = value;
                });
              },
              child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: isTapped
                      ? isExpanded
                          ? 70
                          : 73
                      : isExpanded
                          ? 260
                          : 263,
                  width: isExpanded ? 385 : 390,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[800],
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.5),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tap to Expand it',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            isTapped
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_up,
                            color: Colors.white,
                            size: 27,
                          ),
                        ],
                      ),
                    ],
                  )
                  // : Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Flexible(
                  //         flex: 0,
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             const Text(
                  //               'Tap to Expand it',
                  //               style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontSize: 20,
                  //                   fontWeight: FontWeight.w400),
                  //             ),
                  //             Icon(
                  //               isTapped
                  //                   ? Icons.keyboard_arrow_down
                  //                   : Icons.keyboard_arrow_up,
                  //               color: Colors.white,
                  //               size: 25,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       const SizedBox(height: 20),
                  //       Flexible(
                  //         child: Text(
                  //           isTapped
                  //               ? ''
                  //               : 'Widgets that have global keys reparent '
                  //                   'their subtrees when they are moved from one '
                  //                   'location in the tree to another location in '
                  //                   'the tree. In order to reparent its subtree, '
                  //                   'a widget must arrive at its new location in '
                  //                   'the tree in the same animation frame in '
                  //                   'which it was removed from its old location '
                  //                   'the tree.',
                  //           style: TextStyle(
                  //             color: Colors.white.withOpacity(0.9),
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
