import 'package:custom_fab_menu/custom_fab_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steps Indicator Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF005BFF)),
        useMaterial3: true,
      ),
      home: const ExpandableFABExample(title: 'Expandable FAB Menu Example'),
    );
  }
}

class ExpandableFABExample extends StatefulWidget {
  const ExpandableFABExample({super.key, required this.title});

  final String title;

  @override
  State<ExpandableFABExample> createState() => _ExpandableFABExampleState();
}

class _ExpandableFABExampleState extends State<ExpandableFABExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          'Page 1',
        ),
      ),
      floatingActionButton: FABWidget(
        menuChildren: [
          ChildItem(title: 'Item 1', imageUrl: 'assets/catmeme1.png'),
          ChildItem(title: 'Item 2', imageUrl: 'assets/catmeme2.png'),
          ChildItem(title: 'Item 3', imageUrl: 'assets/catmeme3.png'),
        ],
      ),
    );
  }
}
