import 'package:flutter/material.dart';

class NearByPage extends StatelessWidget {
  const NearByPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(top: 20),
        height: height / 1,
        width: width / 1,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.backspace),
                ),
                const SizedBox(
                  width: 60,
                ),
                const Text(
                  'Explore NearBY',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: width / 1,
                    height: height / 1,
                    child: const NearByPageBuild()),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class NearByPageBuild extends StatefulWidget {
  const NearByPageBuild({super.key});

  @override
  State<NearByPageBuild> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NearByPageBuild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.amber,
        width: 200,
        height: 200,
      )),
    );
  }
}
