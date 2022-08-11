import 'package:flutter/material.dart';
import 'package:flutter_widgets/process_indicator_example.dart';
import 'package:flutter_widgets/reorderable_listview_example.dart';
import 'package:flutter_widgets/snackbar_example.dart';

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
