import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class DraggableExample extends StatefulWidget {
  const DraggableExample({super.key});

  @override
  State<DraggableExample> createState() => _DraggableExampleState();
}

class _DraggableExampleState extends State<DraggableExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Draggable Example')),
      body: DraggableCard(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn,
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.blueGrey[700],
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.7),
                blurRadius: 30,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Drag it',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {
  final Widget child;

  const DraggableCard({super.key, required this.child});

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  var _dragAlignment = Alignment.center;
  late Animation<Alignment> _animation;

  final _spring =
      const SpringDescription(mass: 10, stiffness: 1000, damping: 0.9);

  double _normalizeVelocity(Offset velocity, Size size) {
    final normalizedVelocity =
        Offset(velocity.dx / size.width, velocity.dy / size.height);
    return -normalizedVelocity.distance;
  }

  void _runAnimation(Offset velocity, Size size) {
    _animation = _controller
        .drive(AlignmentTween(begin: _dragAlignment, end: Alignment.center));
    final simulation =
        SpringSimulation(_spring, 0, 0.0, _normalizeVelocity(velocity, size));
    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this)
      ..addListener(() => setState(() => _dragAlignment = _animation.value));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanStart: (details) => _controller.stop(canceled: true),
      onPanUpdate: (details) => setState(
        () => _dragAlignment += Alignment(
          details.delta.dx / (size.width / 2),
          details.delta.dy / (size.height / 2),
        ),
      ),
      onPanEnd: (details) =>
          _runAnimation(details.velocity.pixelsPerSecond, size),
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}
