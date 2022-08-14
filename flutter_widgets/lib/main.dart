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
      // home: const ReorderableListViewExample(title: 'Reorderable ListView Example'),
      home: const SnackBarExample(title: 'SnackBar Example'),
      // home: const ProcessIndicatorExample(title: 'Process Indicator Example'),
    );
  }
}

class SnackBarExample extends StatefulWidget {
  const SnackBarExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SnackBarExample> createState() => _SnackBarExampleState();
}

class _SnackBarExampleState extends State<SnackBarExample> {
  final SnackBar simpleSnackBar = const SnackBar(
    content: Text('This is a Simple SnackBar'),
    duration: Duration(milliseconds: 3000),
  );

  final SnackBar actionSnackBar = SnackBar(
    content: const Text('This is Action SnackBar'),
    duration: const Duration(milliseconds: 3000),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );

  final SnackBar customSnackBar = SnackBar(
    content: Row(
      children: const [
        Icon(
          Icons.info_outline,
          color: Colors.white,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text('This is Custom SnackBar and it is longgggggggggggggg'),
        ),
      ],
    ),
    dismissDirection: DismissDirection.horizontal,
    backgroundColor: Colors.blueGrey,
    duration: const Duration(milliseconds: 3000),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 0,
    behavior: SnackBarBehavior.floating,
  );

  final SnackBar floatingSnackBar = const SnackBar(
    content: Text('This is Floating SnackBar'),
    duration: Duration(milliseconds: 3000),
    shape: StadiumBorder(),
    elevation: 0,
    behavior: SnackBarBehavior.floating,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(simpleSnackBar),
              child: const Text('Simple SnackBar'),
            ),
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(floatingSnackBar),
              child: const Text('Floating SnackBar'),
            ),
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(actionSnackBar),
              child: const Text('Action SnackBar'),
            ),
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context)
                ..clearSnackBars()
                ..showSnackBar(customSnackBar),
              child: const Text('Custom SnackBar'),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
