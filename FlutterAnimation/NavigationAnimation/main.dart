import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const AnimatedNavigationExample(),
    );
  }
}

class AnimatedNavigationExample extends StatefulWidget {
  const AnimatedNavigationExample({super.key});

  @override
  State<AnimatedNavigationExample> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<AnimatedNavigationExample> with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            Navigator.push(
              context,
              FadeAnimatingRoute(
                route: const Destination(),
                page: null,
              ),
            ).then((value) => scaleController.reverse());
          }
        },
      );

    scaleAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(scaleController);
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext c) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // elevation: 15,
        // backgroundColor: Colors.transparent,
        title: const Text('Navigation Animation'),
      ),
      body: Center(
        heightFactor: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Colors.black,
                    strokeAlign: StrokeAlign.center,
                    width: 2,
                  ),
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                FadeAnimatingRoute(
                  route: const Destination(),
                  // page: null,
                ),
              ),
              child: const Text('FadeAnimation'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Colors.black,
                    strokeAlign: StrokeAlign.center,
                    width: 2,
                  ),
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                SizeAnimatingRoute(
                  page: const Destination(),
                  // page: null,
                ),
              ),
              child: const Text('SizeAnimation'),
            ),
            InkWell(
              onTap: () {
                scaleController.forward();
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  shape: BoxShape.circle,
                ),
                child: AnimatedBuilder(
                  animation: scaleAnimation,
                  builder: (c, child) => Transform.scale(
                    scale: scaleAnimation.value,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Colors.black,
                    strokeAlign: StrokeAlign.center,
                    width: 2,
                  ),
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                ScaleAnimatingRoute(
                  page: const Destination(),
                  // page: null,
                ),
              ),
              child: const Text('ScaleAnimation'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Colors.black,
                    strokeAlign: StrokeAlign.center,
                    width: 2,
                  ),
                ),
              ),
              onPressed: () => Navigator.push(
                context,
                SlideAnimationRoute(
                  page: const Destination(),
                  route: const Destination(),
                  // page: null,
                ),
              ),
              child: const Text('SlideAnimation'),
            ),
          ],
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 15,
        centerTitle: true,
        title: const Text('Second Page'),
      ),
    );
  }
}

class FadeAnimatingRoute extends PageRouteBuilder {
  final Widget? page;
  final Widget route;

  FadeAnimatingRoute({this.page, required this.route})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page!,
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}

class SizeAnimatingRoute extends PageRouteBuilder {
  final Widget page;

  SizeAnimatingRoute({required this.page})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page,
            transitionDuration: (const Duration(milliseconds: 1000)),
            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
              animation = CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn);
              return Align(
                alignment: Alignment.bottomCenter,
                child: SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: 0,
                  child: page,
                ),
              );
            });
}

class ScaleAnimatingRoute extends PageRouteBuilder {
  final Widget page;

  ScaleAnimatingRoute({required this.page})
      : super(
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page,
            transitionDuration: (const Duration(milliseconds: 1000)),
            transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
              animation = CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn);
              return Align(
                alignment: Alignment.bottomCenter,
                child: ScaleTransition(
                  scale: animation,
                  child: page,
                ),
              );
            });
}

class SlideAnimationRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  SlideAnimationRoute({required this.page, required this.route})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page,
          transitionDuration: (const Duration(milliseconds: 400)),
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn);
            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0)).animate(animation),
              child: route,
            );
          },
        );
}
