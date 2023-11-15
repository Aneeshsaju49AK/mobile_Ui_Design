import 'package:flutter/material.dart';

class Design05 extends StatefulWidget {
  const Design05({super.key});

  @override
  State<Design05> createState() => _Design01State();
}

class _Design01State extends State<Design05> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text('Order #1688068'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 900,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            'May 31, 05:42 PM',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: CircleAvatar(
                                  radius: 7,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Text('Delivered'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Divider(),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 13),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text('1 ITEM'),
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Icon(
                                          Icons.receipt,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          'RECEIPT',
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                child: Image.asset(
                                  'lib/images/isolated-black-t-shirt-model-front-view.jpg',
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Explore~Men~ Navy Blue',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Text('1 piece'),
                                        Text(
                                          'Size: XL',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            color: Colors.blue[100],
                                          ),
                                          child: Text(
                                            '1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text('X'),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '£799',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 110,
                                              ),
                                              Text(
                                                '£799',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Divider(),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Item Total',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(
                                width: 210,
                              ),
                              Text(
                                '£799',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Delivery',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(
                                width: 220,
                              ),
                              Text(
                                'FREE',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                'Grand Total',
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 180,
                              ),
                              Text(
                                '£799',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  'CUSTOMER DETAILS',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.share),
                                    Text(
                                      'SHARE',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.blue),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Deepa',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text('+91-7829000484')
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 120,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                        'lib/images/76433-illustration-vector-graphics-logo-whatsapp-stock.png',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                          'lib/images/white-phone-icon-png--clipart-best-30.png'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Address',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              Text('D 1101 Chartered Beverly'),
                              Text('Hills ,Subramanyapura P.O')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'City',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text('Bangalore'),
                                ],
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pincode',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text('560061')
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Payment',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text('Online')
                                ],
                              ),
                              SizedBox(
                                width: 180,
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Colors.blue[100]),
                                height: 25,
                                width: 50,
                                child: Text(
                                  'PAID',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.green[700],
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ADDITIONAL INFORMATION',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'State',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Karnataka',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text('greeniceaqua@gmail.com'),
                        Container(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Share receipt',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            ),
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(LinearBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 1))),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(items: [
        //   BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.home,
        //       ),
        //       label: 'Home'),
        // ])
      bottomNavigationBar:  Container(
          height: 35,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: IconButton(onPressed:
                (){}, icon: Icon(Icons.backspace_rounded)),
              ),
               Container(
                child: IconButton(onPressed:
                (){}, icon: Icon(Icons.center_focus_strong_rounded)),
              ),
               Container(
                child: IconButton(onPressed:
                (){}, icon: Icon(Icons.list)),
              )
            ],
          ),
        ),

        );
  }
}
