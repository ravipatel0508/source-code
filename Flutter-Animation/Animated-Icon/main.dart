//
// Animated Icon
//
// Created by: Ravi Patel
// Instagram: @bugs_fixes (https://www.instagram.com/bugs_fixes)
//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedIconExample extends StatefulWidget {
  const AnimatedIconExample({super.key});

  @override
  State<AnimatedIconExample> createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample>
    with TickerProviderStateMixin {
  bool expanded = true;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        title: const Text('Animated Icon Example'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                iconSize: 37,
                color: Theme.of(context).primaryColor,
                icon: AnimatedIcon(
                  icon: AnimatedIcons.add_event,
                  progress: controller,
                ),
                onPressed: () {
                  setState(() {
                    expanded ? controller.forward() : controller.reverse();
                    expanded = !expanded;
                  });
                },
              ),
              IconButton(
                  iconSize: 37,
                  color: Theme.of(context).primaryColor,
                  // color: Theme.of(context).colorScheme.primary,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.arrow_menu, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 37,
                  color: Theme.of(context).primaryColor,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.close_menu, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 37,
                  color: Theme.of(context).primaryColor,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.ellipsis_search,
                      progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 37,
                  color: Theme.of(context).primaryColor,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.event_add, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  iconSize: 37,
                  color: Theme.of(context).primaryColor,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.home_menu, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 37,
                  color: Theme.of(context).primaryColor,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.list_view, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 37,
                  color: Theme.of(context).primaryColor,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_arrow, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 37,
                  color: Theme.of(context).primaryColor,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 37,
                  color: Theme.of(context).primaryColor,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_home, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  iconSize: 37,
                  color: Theme.of(context).primaryColor,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.pause_play, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 37,
                  color: Theme.of(context).primaryColor,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.play_pause, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 37,
                  color: Theme.of(context).primaryColor,
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.search_ellipsis,
                      progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                iconSize: 37,
                color: Theme.of(context).primaryColor,
                icon: AnimatedIcon(
                    icon: AnimatedIcons.view_list, progress: controller),
                onPressed: () {
                  setState(
                    () {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    },
                  );
                },
              ),
              IconButton(
                iconSize: 37,
                color: Theme.of(context).primaryColor,
                icon: AnimatedIcon(
                    icon: AnimatedIcons.ellipsis_search, progress: controller),
                onPressed: () {
                  setState(
                    () {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
