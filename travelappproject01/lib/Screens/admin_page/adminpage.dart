import 'package:flutter/material.dart';
import 'package:travelapp_project01/Screens/admin_page/Places_details.dart';
import 'package:travelapp_project01/Screens/admin_page/page_02.dart';
import 'package:travelapp_project01/Screens/admin_page/page_03.dart';
import 'package:travelapp_project01/Screens/admin_page/page_04.dart';

class AdminPage extends StatefulWidget {
  AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int index = 0;

  final List<Widget> pages = [
    TreadingPlace01(),
    MyPlace02(),
    MyPlace03(),
    MyPlace04(),
  ];

  late List<String> page_head = [
    'UserDetails',
    'TreadingPlace',
    'Recommend',
    'Categories',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin panel',
        ),
      ),
      body: SafeArea(
          child: SizedBox(
              child: ListView.builder(
        itemCount: page_head.length,
        itemBuilder: (context, index) {
          currentIndex:
          index;

          return ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  this.index = index;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => pages[index]));
              },
              icon: const Icon(Icons.add),
              label: Text(page_head[index]));
        },
      ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
