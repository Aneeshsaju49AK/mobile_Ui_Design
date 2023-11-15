import 'package:flutter/material.dart';

class MyPlace02 extends StatefulWidget {
  const MyPlace02({super.key});

  @override
  State<MyPlace02> createState() => _MyPlace02State();
}

class _MyPlace02State extends State<MyPlace02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SizedBox()),
      floatingActionButton:
          FloatingActionButton.extended(onPressed: () {}, label: Text('add')),
    );
  }
}
