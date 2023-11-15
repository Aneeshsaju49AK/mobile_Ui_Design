import 'package:flutter/material.dart';
import 'package:travelapp_project01/Screens/user_pages/homepage.dart';

class PopularCategoriesPage extends StatefulWidget {
  const PopularCategoriesPage({super.key});

  @override
  State<PopularCategoriesPage> createState() => _PopularCategoriesPageState();
}

class _PopularCategoriesPageState extends State<PopularCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var weight = size.width;
    var height = size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: SizedBox(
                  width: weight / 1,
                  height: height / 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.backspace),
                            ),
                          ),
                          const Text(
                            'Hills',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: SizedBox(
                            width: weight / 1,
                            height: height / 1,
                            child: popularCategoriesBuild(context)),
                      ),
                    ],
                  ))),
        ),
        bottomSheet: SizedBox(
          height: 60,
          child: NaveBar(context),
        ));
  }
}

Widget popularCategoriesBuild(context) {
  var size = MediaQuery.of(context).size;
  var weight = size.width;
  var height = size.height;
  return GridView.builder(
    itemCount: 5,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1),
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.amber),
          height: height / 3,
          width: weight / 2,
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              Image.asset(
                'lib/asset/imges/images (1).png',
                fit: BoxFit.fill,
                width: weight / 1,
              ),
              Positioned(
                top: height / 9,
                left: weight / 19,
                child: const Text(
                  'Kerala',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Positioned(
                top: height / 7,
                left: weight / 19,
                child: const Text(
                  'Kerala',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Positioned(
                height: height / 11,
                left: weight / 3.5,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 30,
                  child: Image.asset(
                    'lib/asset/icons/heart.png',
                    width: weight / 9,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
