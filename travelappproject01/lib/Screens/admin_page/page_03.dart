import 'package:flutter/material.dart';

class MyPlace03 extends StatefulWidget {
  const MyPlace03({super.key});

  @override
  State<MyPlace03> createState() => _MyPlace03State();
}

class _MyPlace03State extends State<MyPlace03> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SizedBox()),
      floatingActionButton:
          FloatingActionButton.extended(onPressed: () {}, label: Text('add')),
    );
  }
}
