import 'package:flutter/material.dart';

class Design02 extends StatefulWidget {
  const Design02({super.key});

  @override
  State<Design02> createState() => _Design01State();
}

class _Design01State extends State<Design02> {
  List<String> images = [
    'lib/images/loud-speaker.png',
    'lib/images/rupee.png',
    'lib/images/discount_879757.png',
    'lib/images/friends_9916841.png',
    'lib/images/qr-code_3036996.png',
    'lib/images/money_423494.png',
    'lib/images/checklist_5063948.png',
  ];
  List<Color> colors_01 = [
    Color.fromARGB(255, 218, 106, 16),
    Color.fromARGB(255, 90, 180, 93),
    Color.fromARGB(255, 182, 132, 57),
    Color.fromARGB(255, 68, 170, 153),
    Color.fromARGB(255, 80, 87, 88),
    Color.fromARGB(255, 107, 92, 173),
    Color.fromARGB(255, 173, 43, 156)
  ];

  List<String> names = [
    'Marketing',
    'Online',
    'Discount',
    'My',
    'Store QR',
    'Extra',
    'Order'
  ];
  List<String> names_sub = [
    'Designs',
    'Payments',
    'Coupons',
    'Customers',
    'Code',
    'Charges',
    'Form'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leadingWidth: 100,
        foregroundColor: Colors.white,
        title: Text('Manage Store'),
      ),
      body: Container(
        child: myWidget(context),
      ),
    );
  }

  Widget myWidget(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colors_01[index],
                      ),
                      height: 50,
                      width: 50,
                      child: Image.asset(images[index]),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            names[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            names_sub[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
