import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_project01/Screens/user_pages/getstartpage.dart';
import 'package:travelapp_project01/Screens/user_pages/homepage.dart';
import 'package:travelapp_project01/Screens/user_pages/loginpage.dart';
import 'package:travelapp_project01/Screens/user_pages/signinpage.dart';
import 'package:travelapp_project01/hive/model/place_model.dart';
import 'package:travelapp_project01/hive/model/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.initFlutter();

  Hive.registerAdapter(UserProfileAdapter());
  Hive.registerAdapter(PlaceModelAdapter());
  await Hive.openBox<UserProfile>('userProfile');
  await Hive.openBox<PlaceModel>('places');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'splash Screen',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        'GetstartPage': (context) => const GetStartedPage(),
        'SignInPage': (context) => const SignInPage(),
        'LoginPage': (context) => const MyLoginPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
        final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

        if (isFirstTime) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const GetStartedPage(),
            ),
          );
          prefs.setBool('isFirstTime', false);
        } else if (isLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePageMain(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyLoginPage(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SizedBox(
          width: width / 1,
          height: height / 1,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Container(
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('lib/asset/imges/images (1).png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text(
                          'City',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(
                        child: Text(
                          'mapp',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue[400]),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: const Text(
                      'Know your city',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
