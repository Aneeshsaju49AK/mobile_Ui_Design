import 'package:flutter/material.dart';

class Design06 extends StatefulWidget {
  const Design06({super.key});

  @override
  State<Design06> createState() => _Design01State();
}

class _Design01State extends State<Design06> {
  bool light = false;

  List<String> images = [
    'lib/images/full-length-portrait-handsome-serious-man_171337-17388.avif',
    'lib/images/charming-wavy-haired-woman-with-bright-lipstick-green-modern-dress-accessories-looking-into-camera-posing-isolated-backdrop_197531-27986.avif',
    'lib/images/pink-sweater-front_125540-746.avif',
    'lib/images/trendy-top-design-mockup-presented-wooden-hanger_460848-13969.avif',
    'lib/images/indian-man-traditional-wear-kurta-pyjama-cloths-male-fashion-model-sherwani-posing-standing-against-brown-grunge-background-selective-focus_466689-45389.avif',
    'lib/images/handsome-stylish-indian-model-man-casual-close-posing-pastel-wall_496169-1577.avif',
    'lib/images/full-length-portrait-handsome-serious-man_171337-17388.avif',
    'lib/images/charming-wavy-haired-woman-with-bright-lipstick-green-modern-dress-accessories-looking-into-camera-posing-isolated-backdrop_197531-27986.avif',
    'lib/images/pink-sweater-front_125540-746.avif',
    'lib/images/trendy-top-design-mockup-presented-wooden-hanger_460848-13969.avif',
    'lib/images/indian-man-traditional-wear-kurta-pyjama-cloths-male-fashion-model-sherwani-posing-standing-against-brown-grunge-background-selective-focus_466689-45389.avif',
    'lib/images/handsome-stylish-indian-model-man-casual-close-posing-pastel-wall_496169-1577.avif',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              centerTitle: true,
              title: Text('Catalogue'),
              bottom: TabBar(tabs: [
                Tab(
                  text: 'Products',
                ),
                Tab(
                  text: 'categories',
                )
              ]),
            ),
            body: TabBarView(children: [
              Container(
                child: myList(context),
              ),
              Container(
                child: Text('2'),
              )
            ])));
  }

  Widget myList(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(10),
                  ),
                  border: Border.all()),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            height: 90,
                            width: 80,
                            color: Colors.white,
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            'Couch Pototo~ Women... ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Icon(Icons.line_axis),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '1 piece',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '£799',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Text(
                                            'In stock',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Container(
                                          child: Switch(
                                              value: light,
                                              onChanged: ((value) {
                                                setState(() {
                                                  light = value;
                                                });
                                              })),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Divider(),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Icon(
                            Icons.share,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text(
                            'Share Product',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
