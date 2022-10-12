import 'package:flutter/material.dart';

class AnimatedIconExample extends StatefulWidget {
  const AnimatedIconExample({super.key});

  @override
  State<AnimatedIconExample> createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample> with TickerProviderStateMixin {
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
      appBar: AppBar(
        title: const Text('Animated Icon Example'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                iconSize: 35,
                icon: AnimatedIcon(
                  icon: AnimatedIcons.view_list,
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
                  iconSize: 35,
                  icon: AnimatedIcon(icon: AnimatedIcons.pause_play, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 35,
                  icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 35,
                  icon: AnimatedIcon(icon: AnimatedIcons.add_event, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 35,
                  icon: AnimatedIcon(icon: AnimatedIcons.arrow_menu, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  iconSize: 35,
                  icon: AnimatedIcon(icon: AnimatedIcons.close_menu, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 35,
                  icon: AnimatedIcon(icon: AnimatedIcons.add_event, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 35,
                  icon: AnimatedIcon(icon: AnimatedIcons.event_add, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 35,
                  icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 35,
                  icon: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  iconSize: 35,
                  icon: AnimatedIcon(icon: AnimatedIcons.list_view, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 35,
                  icon: AnimatedIcon(icon: AnimatedIcons.home_menu, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                  iconSize: 35,
                  icon: AnimatedIcon(icon: AnimatedIcons.ellipsis_search, progress: controller),
                  onPressed: () {
                    setState(() {
                      expanded ? controller.forward() : controller.reverse();
                      expanded = !expanded;
                    });
                  }),
              IconButton(
                iconSize: 35,
                icon: AnimatedIcon(icon: AnimatedIcons.search_ellipsis, progress: controller),
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
                iconSize: 35,
                icon: AnimatedIcon(icon: AnimatedIcons.add_event, progress: controller),
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
