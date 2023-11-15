import 'package:flutter/material.dart';

class MyFavirotes extends StatelessWidget {
  const MyFavirotes({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                    'My Favorites',
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
                      child: const MyFavirtesBuild()),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class MyFavirtesBuild extends StatefulWidget {
  const MyFavirtesBuild({super.key});

  @override
  State<MyFavirtesBuild> createState() => _MyFavirtesBuildState();
}

class _MyFavirtesBuildState extends State<MyFavirtesBuild> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var weight = size.width;
    var height = size.height;
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              width: weight / 1.3,
              height: height / 4,
              child: Stack(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                children: [
                  Image.asset(
                    'lib/asset/imges/images (1).png',
                    fit: BoxFit.fill,
                    width: weight / 1.09,
                  ),
                  Positioned(
                    height: height / 9,
                    left: weight / 1.4,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 30,
                      child: Image.asset(
                        'lib/asset/icons/heart.png',
                        width: weight / 9,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 100,
                    left: 20,
                    child: Text(
                      'Place Name',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Positioned(
                    top: 130,
                    left: 20,
                    child: Text(
                      'Place Name',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
