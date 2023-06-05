import 'package:flutter/material.dart';
import 'dart:math';

class SlidableCardExample extends StatefulWidget {
  const SlidableCardExample({super.key});

  @override
  State<SlidableCardExample> createState() => _SlidableCardExampleState();
}

class _SlidableCardExampleState extends State<SlidableCardExample> {
  double _page = 10;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    PageController pageController;
    pageController = PageController(initialPage: 10);
    pageController.addListener(
      () {
        setState(
          () {
            _page = pageController.page!;
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Slidable Card'),
      ),
      body: Center(
        heightFactor: 1.2,
        child: Stack(
          children: [
            SizedBox(
              height: width,
              width: width * .95,
              child: LayoutBuilder(
                builder: (context, boxConstraints) {
                  List<Widget> cards = [];

                  for (int i = 0; i <= 11; i++) {
                    double currentPageValue = i - _page;
                    bool pageLocation = currentPageValue > 0;

                    double start = 20 +
                        max(
                            (boxConstraints.maxWidth - width * .75) -
                                ((boxConstraints.maxWidth - width * .75) / 2) *
                                    -currentPageValue *
                                    (pageLocation ? 9 : 1),
                            0.0);

                    var customizableCard = Positioned.directional(
                      top: 20 + 30 * max(-currentPageValue, 0.0),
                      bottom: 20 + 30 * max(-currentPageValue, 0.0),
                      start: start,
                      textDirection: TextDirection.ltr,
                      child: Container(
                        height: width * .67,
                        width: width * .67,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[100 * (i % 9) + 100],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.15),
                                blurRadius: 10)
                          ],
                        ),
                      ),
                    );
                    cards.add(customizableCard);
                  }
                  return Stack(children: cards);
                },
              ),
            ),
            Positioned.fill(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: 11,
                controller: pageController,
                itemBuilder: (context, index) {
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
