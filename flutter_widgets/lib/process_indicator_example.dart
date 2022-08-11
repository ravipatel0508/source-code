import 'package:flutter/material.dart';

class ProcessIndicatorExample extends StatefulWidget {
  const ProcessIndicatorExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ProcessIndicatorExample> createState() => _ProcessIndicatorExampleState();
}

class _ProcessIndicatorExampleState extends State<ProcessIndicatorExample> {
  double _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Future.delayed(const Duration(milliseconds: 10), () {
          setState(() {
            if (_value == 100) {
              _value = 1;
            } else {
              _value = _value + 1;
            }
          });
        }),
        builder: (context, snapshot) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: LinearProgressIndicator(
            minHeight: _value,
            color: Colors.blueGrey,
            value: _value / 100,
            semanticsLabel: 'Loading',
          ),
        ),
      ),
    );
  }
}
