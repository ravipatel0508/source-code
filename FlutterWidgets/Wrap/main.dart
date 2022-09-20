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
      home: const WrapExample(title: 'Wrap Example'),
    );
  }
}

class WrapExample extends StatelessWidget {
  const WrapExample({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blueGrey[200],
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            verticalDirection: VerticalDirection.up,
            textDirection: TextDirection.ltr,
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.end,
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.spaceAround,
            spacing: 12,
            runSpacing: 10,
            children: <Widget>[
              Chip(
                label: Text(
                  'Hello',
                  style: Theme.of(context).textTheme.headline4!,
                ),
              ),
              Chip(
                label: Text(
                  'Bugs',
                  style: Theme.of(context).textTheme.headline4!,
                ),
              ),
              Chip(
                label: Text(
                  'And',
                  style: Theme.of(context).textTheme.headline4!,
                ),
              ),
              Chip(
                label: Text(
                  'Fixes',
                  style: Theme.of(context).textTheme.headline4!,
                ),
              ),
              const Chip(
                label: Icon(
                  Icons.favorite,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
