import 'package:flutter/material.dart';

class Design01 extends StatefulWidget {
  const Design01({super.key});

  @override
  State<Design01> createState() => _Design01State();
}

class _Design01State extends State<Design01> {
  bool light =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Additional Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 630,
          
          child: Column(
            children: [
              Container(
                height: 50,
                
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.share),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Text(
                        'Share Dukaan App',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                    ),
                    Container(
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_forward)),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.chat),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Text(
                        'Change Language',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                    ),
                    Container(
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_forward)),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
              
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.chat_bubble_outline),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Text(
                        'WhatsApp Chat Support',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      height: 40,
                      child: Switch(value: light, onChanged: ( (value) {
                         setState(() {
                           light =value;
                         });
                      })),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
              
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.lock),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.star),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Text(
                        'Rate Us',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                
                child: Row(
                  children: [
                    Container(
                      child: Icon(Icons.logout_outlined),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 230,
              ),
              Container(
                child: Column(
                  children: [
                    Text('Version'),
                    Text('2.4.2'),
                  ],
                ),
              )
            ],
            
          ),
        ),
        
      ),
      
      bottomNavigationBar: 
      Container(
        height: 40,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
