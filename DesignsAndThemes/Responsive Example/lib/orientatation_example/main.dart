import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orientation Demo',
      home: MyHomePage(title: 'Orientation Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.brown[200],
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return orientation == Orientation.portrait ? _buildVerticalLayout() : _buildHorizontalLayout();
        },
      ),
    );
  }
}

Widget _buildVerticalLayout() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.brown[200],
              radius: 35,
              child: const Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            const Text(
              '@bugs_fixes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return const ListTile(
              title: Text('Demo Data'),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: 10,
        ),
      ],
    ),
  );
}

Widget _buildHorizontalLayout() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.brown[200],
              radius: 35,
              child: const Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            const Text(
              '@bugs_fixes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Expanded(
        flex: 2,
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return const ListTile(
              title: Text('Demo Data'),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: 10,
        ),
      ),
    ],
  );
}
