import 'package:flutter/material.dart';

class ElevatedAnimation extends StatefulWidget {
  const ElevatedAnimation({super.key});

  @override
  State<ElevatedAnimation> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<ElevatedAnimation> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 1.0, end: 13.0).animate(_animationController)
      ..addListener(
        () => setState(() {}),
      );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animation.isDismissed;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elevated Animation'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            childAspectRatio: 2,
          ),
          children: [
            Container(
              // width: 100,
              // height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.shade200,
                    blurRadius: _animation.value + _animation.value,
                    spreadRadius: _animation.value,
                    offset: Offset(_animation.value, _animation.value),
                  ),
                ],
              ),
              child: const Icon(Icons.favorite, color: Colors.red, size: 40),
            ),
            Container(
              // width: 100,
              // height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade100,
                    blurRadius: _animation.value + _animation.value,
                    spreadRadius: _animation.value,
                    offset: Offset(_animation.value, _animation.value),
                  ),
                ],
              ),
              child: const Icon(Icons.bookmark_add_outlined, color: Colors.blue, size: 40),
            ),
            Container(
              // width: 100,
              // height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: _animation.value + _animation.value,
                    spreadRadius: _animation.value,
                    offset: Offset(_animation.value, _animation.value),
                  ),
                ],
              ),
              child: const Icon(Icons.person_add, color: Colors.blueGrey, size: 40),
            ),
            Container(
              // width: 100,
              // height: 100,
              margin: const EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: _animation.value + _animation.value,
                    spreadRadius: _animation.value,
                    offset: Offset(_animation.value, _animation.value),
                  ),
                ],
              ),
              child: Icon(Icons.favorite, color: Colors.pink.withOpacity(0.7), size: 40),
            ),
          ],
        ),
      ),
    );
  }
}
