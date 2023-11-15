import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Design03 extends StatefulWidget {
  const Design03({super.key, this.url});
  final url;

  @override
  State<Design03> createState() => _Design01State();
}

class _Design01State extends State<Design03> {
  List<String> images = [
    'lib/images/loud-speaker.png',
    'lib/images/rupee.png',
    'lib/images/discount_879757.png',
    'lib/images/laptop_689396.png',
   
  ];
  late YoutubePlayerController _controller;

  void runyoutubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId: "iLnmTe5Q2Qw",
        flags: YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: true,
          mute: true,
        ));
  }

  @override
  void initState() {
    runyoutubePlayer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> items = [
    'Dukaan caters to a wide variety of sellers beit a small grocery store or a big legacy brand anyone who wants to sell their products/sevicess online-Dukaan is the perfect platform for you',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dukaan Premium'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 2000,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  color: Colors.blue,
                ),
              ),
              Positioned(
                  top: 60,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),  color: Colors.white,),
                    width: 340,
                    height: 200,
                  
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(radius: 30,
                                backgroundImage: AssetImage('lib/images/online-shop_8921504.png',
                                ),),
                               Column(
                                children: [
                                   Text('dukaan',
                                   style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800
                                   ),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30,),
                                  child: Text('PREMIUM',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue,
                                  ),),
                                )
                                ],
                               )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Get Dukaan Premium for just',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),),
                          Text('£4,999/year',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),),
                          Text('All the advanced features for scaling your',
                          style: TextStyle(
                            fontSize: 12,

                          ),),
                          Text('business.',
                          style: TextStyle(
                            fontSize: 12,
                          ),),
                    
                        ],
                      ),
                    ),
                    
                  )),
              Positioned(
                  top: 280,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 1700,
                      width: 340,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Features',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 400,
                            width: double.infinity,
                            child: buildListView(),
                          ),
                          Divider(),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              'What is Dukaan Premium?',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.all(
                                      Radius.circular(10))),
                              height: 200,
                              width: double.infinity,
                              child: YoutubePlayerBuilder(
                                  player:
                                      YoutubePlayer(controller: _controller),
                                  builder: (context, player) {
                                    return Column(
                                      children: [
                                        player,
                                      ],
                                    );
                                  }),
                            ),
                          ),
                          //   Center(
                          //   child: DropdownButton<String>(

                          //     icon: Icon(Icons.add),
                          //     isExpanded: true,
                          //     value: selectedValue,
                          //     onChanged: (String? newValue) {
                          //       setState(() {
                          //         selectedValue = newValue!;
                          //       });
                          //     },
                          //     items: items.map((String value) {

                          //       return DropdownMenuItem<String>(
                          //         value: value,
                          //         child: Text(value),
                          //       );
                          //     }).toList(),
                          //   ),
                          // ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'Frequently asked questions',
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
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'What types of businesses can use Dukaan',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            'Premium?',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      )),
                                      Container(
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.add)),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Text(
                                      'Dukaan caters to a wide variety of sellers beit a small grocery store or a big legacy brand anyone who wants to sell their products/sevicess online-Dukaan is the perfect platform for you'),
                                ),
                                Divider(),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'what is your refund policy',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                         
                                        ],
                                      )),
                                      SizedBox(
                                        width: 110,
                                      ),
                                      Container(
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.add)),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Will there be an automatic charge after the',
                                            style: TextStyle(
                                                fontSize: 14.5,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            'paid trail?',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      )),
                                      Container(
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.add)),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'what payment methods do you offer',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                         
                                        ],
                                      )),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Container(
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.add)),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'What happens when my free trail ends?',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                         
                                        ],
                                      )),
                                      SizedBox(
                                        width: 17,
                                      ),
                                      Container(
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.add)),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'What are the terms for the custom domain?',
                                            style: TextStyle(
                                                fontSize: 14.5,
                                                fontWeight: FontWeight.w500),
                                          ),
                                         
                                        ],
                                      )),
                                      Container(
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.add)),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 10,
                          ),
                          Container(
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text('Need help? Get in touch',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          
                                          border: Border.all(),
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                        ),
                                        child: 
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              child: Icon(Icons.chat),
                                            ),
                                            Container(
                                              child: Text('Live Chat'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          
                                          border: Border.all(),
                                          borderRadius: BorderRadius.all(Radius.circular(10))
                                        ),
                                        child: 
                                        Column(
                                          
                                          children: [
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              child: Icon(Icons.call),
                                            ),
                                            Container(
                                              child: Text('Phone Call'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    
                                      
                                    ],
                                  ),
                                ),
                               

                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: TextButton(onPressed: (){}, child: Text('Select Domain')),
                                ),
                                Container(
                                  child: TextButton(onPressed: (){}, child: Text('Get Premium'),
                                  style: ButtonStyle(shape: MaterialStatePropertyAll(LinearBorder.none),
                                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                                  foregroundColor: MaterialStatePropertyAll(Colors.white)),
                                  ),
                                )
                              ],
                            )
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            width: 300,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(images[index]),
                    
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
                      Text(
                        'Custom domain name',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Verified seller badge ',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Your brand on the internet',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
