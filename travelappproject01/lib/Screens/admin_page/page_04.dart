import 'package:flutter/material.dart';

class MyPlace04 extends StatefulWidget {
  const MyPlace04({super.key});

  @override
  State<MyPlace04> createState() => _MyPlace04State();
}

class _MyPlace04State extends State<MyPlace04> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SizedBox()),
      floatingActionButton:
          FloatingActionButton.extended(onPressed: () {}, label: Text('add')),
    );
  }
}
