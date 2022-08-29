import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const PositionedTransitionExample(),
    );
  }
}

class PositionedTransitionExample extends StatefulWidget {
  const PositionedTransitionExample({Key? key}) : super(key: key);

  @override
  State<PositionedTransitionExample> createState() => _PositionedTransitionExampleState();
}

class _PositionedTransitionExampleState extends State<PositionedTransitionExample> with TickerProviderStateMixin {
  late final AnimationController _controller;
  final double smallLogo = 50;
  final double bigLogo = 150;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final Size biggest = constraints.biggest;
            return Stack(
              children: <Widget>[
                PositionedTransition(
                  rect: RelativeRectTween(
                    begin: RelativeRect.fromSize(
                      Rect.fromLTWH(
                        biggest.width / 2 - (smallLogo / 2),
                        0,
                        smallLogo,
                        smallLogo,
                      ),
                      biggest,
                    ),
                    end: RelativeRect.fromSize(
                      Rect.fromLTWH(
                        biggest.width / 2 - (bigLogo / 2),
                        biggest.height / 2 - (bigLogo / 2),
                        bigLogo,
                        bigLogo,
                      ),
                      biggest,
                    ),
                  ).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: Curves.elasticInOut,
                    ),
                  ),
                  child: Image.asset('assets/ProfilePic.png'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
