import 'package:flutter/material.dart';

class ExpandableLetterExample extends StatefulWidget {
  const ExpandableLetterExample({Key? key}) : super(key: key);
  @override
  State<ExpandableLetterExample> createState() => _ExpandableLetterExampleState();
}

class _ExpandableLetterExampleState extends State<ExpandableLetterExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expandable Letter')),
      body: const AnimCard(
        Color(0xffFF6594),
        '',
        '',
        '',
      ),
    );
  }
}

class AnimCard extends StatefulWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;

  const AnimCard(this.color, this.num, this.numEng, this.content, {super.key});

  @override
  State<AnimCard> createState() => _AnimCardState();
}

class _AnimCardState extends State<AnimCard> {
  var padding = 150.0;
  var bottomPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 0.6,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPadding(
            padding: EdgeInsets.only(top: padding, bottom: bottomPadding),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            child: CardItem(
              widget.color,
              widget.num,
              widget.numEng,
              widget.content,
              () {
                setState(() {
                  padding = padding == 0 ? 150.0 : 0.0;
                  bottomPadding = bottomPadding == 0 ? 150 : 0.0;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 200),
              height: 180,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Color(0xffFF6594).withOpacity(0.2), blurRadius: 30)],
                color: Colors.grey.shade200.withOpacity(1.0),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Center(
                  child: Icon(Icons.favorite,
                      color: const Color(0xffFF6594).withOpacity(1.0), size: 70)),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;
  final Function()? onTap;

  const CardItem(this.color, this.num, this.numEng, this.content, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: 220,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: const Color(0xffFF6594).withOpacity(0.4), blurRadius: 25),
          ],
          color: color.withOpacity(1.0),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Tap to view more',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Express your Love for Flutter this Valentine\'s Day 🤍😉 @bugs_fixes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
