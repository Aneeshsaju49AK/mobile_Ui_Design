import 'package:flutter/material.dart';
import 'package:ui_design/screen/ui_design_01.dart';
import 'package:ui_design/screen/ui_design_02.dart';
import 'package:ui_design/screen/ui_design_03.dart';
import 'package:ui_design/screen/ui_design_04.dart';
import 'package:ui_design/screen/ui_design_05.dart';
import 'package:ui_design/screen/ui_design_06.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '(9th Week Ui_Design)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        
        title: '9th Week Ui_Design'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 175, 85, 171),
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: IconButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context) => Design01()  ));
              }, icon: Icon(Icons.home), ),
            ),
            Container(
              child: IconButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context) => Design02()  ));
              }, icon: Icon(Icons.tab)),
            ),
            Container(
              child: IconButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context) => Design03()  ));
              }, icon: Icon(Icons.file_copy)),
            ),
            Container(
              child: IconButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context) => Design04()  ));
              }, icon: Icon(Icons.flag)),
            ),
            Container(
              child: IconButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context) => Design05()  ));
              }, icon: Icon(Icons.sticky_note_2)),
            ),
            Container(
              child: IconButton(onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context) => Design06()  ));
              }, icon: Icon(Icons.file_download_done)),
            ),
          ],
        ),
      ),
    );
    
  }
}
