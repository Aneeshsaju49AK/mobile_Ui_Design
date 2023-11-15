import 'package:flutter/material.dart';

class Design04 extends StatefulWidget {
  const Design04({super.key});

  @override
  State<Design04> createState() => _Design01State();
}

class _Design01State extends State<Design04> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        
        title: Text('Payments',),
        
        
         
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 330,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Transaction Limit',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),),
                        Text('A free limit up to which you will receive'),
                        Text('the online payments directly in your bank'),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: LinearProgressIndicator(
                           value: 30/100,
                            semanticsLabel: 'aneesh',
                            color: Colors.blue,
                          ),
                        ),
                        Text('36668 left out of £50,000'),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          style: ButtonStyle(shape: MaterialStatePropertyAll(LinearBorder()),backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                          onPressed: (){}, 
                          child: Text('Increase limit',
                          style: TextStyle(
                            color: Colors.white
                          ),),)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                          Row(
                            children: [
                              Text('Default Method',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                              ),),
                              SizedBox(
                                width: 100,
                              ),
                              Text('Online Payments >')
                            ],
                            
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text('Payment Profile ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                              ),),
                              SizedBox(
                                width: 112,
                              ),
                              Text('Bank Account >')
                            ],
                            
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Payments Overview',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),),
                          SizedBox(
                            width: 125,
                          ),
                          Text('Life Time >')
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100,
                            width: 160,
                            decoration: BoxDecoration(border: Border.all(),color: Colors.orange,borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('AMOUNT ON HOLD',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),),
                                  Text('@0',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),)
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 160,
                            decoration: BoxDecoration(border: Border.all(),color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('AMOUNT RECEIVED',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),),
                                  Text('@13,332',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Transactions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),),
                        // Row(
                          
                        //   children: [
                        //     DefaultTabController(
                        //       length: 3, child: TextButton(
                        //         onPressed: (){}, child: TabBar(
                        //           tabs: 
                        //           [
                        //            Tab( text: 'On hold',),
                        //            Tab(text: 'Payouts(15)',),
                                 
                        //           ])))
                        //   ],
                        // )
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              
                              style: ButtonStyle(shape: MaterialStatePropertyAll(LinearBorder()),backgroundColor: MaterialStatePropertyAll(Colors.grey),),
                              onPressed: (){}, 
                              child: Text('On hold')
                              ),
                              TextButton(
                                style: ButtonStyle(shape: MaterialStatePropertyAll(LinearBorder()),backgroundColor: MaterialStatePropertyAll(Colors.grey),),
                                onPressed: (){}, 
                                child: Text('Payouts(15)',
                                style: TextStyle(
                                  color: Colors.white
                                ),),
                                ),
                                TextButton(
                                  style: ButtonStyle(shape: MaterialStatePropertyAll(LinearBorder()),backgroundColor: MaterialStatePropertyAll(Colors.grey),),
                                  onPressed: (){},
                                   child: Text('Refunds'))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1000,
                          child: myLIst(context),
                          
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget myLIst(BuildContext context){
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index){
        return Container(
          height: 100,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text('Order £1688068',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),),
                          Text('Jul 12, 02:06 PM',
                          style: TextStyle(
                            color: Colors.grey,
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      child: Column(
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text('£799',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue
                            ),),
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green,
                                
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Successful')
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Text('£799 deposited for 588778425389',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                  color: Colors.black
                ),),
              )
            ],
          ),
        );
      });
  }
}