import 'package:flutter/material.dart';

import 'package:travelapp_project01/Screens/admin_page/adminpage.dart';
import 'package:travelapp_project01/Screens/user_pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_project01/Screens/user_pages/signinpage.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _checkUserRole() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');
    final isAdmin = prefs.getBool('isAdmin');

    final enteredEmail = _emailController.text;
    final enteredPassword = _passwordController.text;

    if (enteredEmail == 'admin@gmail.com' && enteredPassword == 'admin') {
      prefs.setBool('isLoggedIn', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AdminPage(),
        ),
      );
    } else if (savedEmail == enteredEmail && savedPassword == enteredPassword) {
      prefs.setBool('isLoggedIn', true);
      if (isAdmin == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AdminPage(),
          ),
        );
      } else {
        prefs.setBool('isLoggedIn', true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePageMain(),
          ),
        );
      }
    } else {
      _showErrorDialog('Invalid email or password');
    }
  }

  void _login() {
    if (_formkey.currentState!.validate()) {
      _checkUserRole();
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Login Failed'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
              top: 80,
              left: 20,
              child: Text(
                'Sign in to your account',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              )),
          Positioned(
            top: 140,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(10)),
                    color: Colors.white70),
                width: width / 2 * 1.9,
                height: height / 1.2,
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Email',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10)),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Password',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 21),
                        child: TextButton(
                          style: ButtonStyle(
                              fixedSize: MaterialStatePropertyAll(
                                  Size(width / 1.2, height / 19)),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.blue),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: const BorderSide(
                                          width: 0, color: Colors.black)))),
                          onPressed: () {
                            _login();
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Center(
                        child: Text(
                          'or',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: AnimatedIcon(
                              icon: AnimatedIcons.add_event,
                              progress: animation,
                              size: 30,
                              semanticLabel: 'show menu',
                            ),
                          ),
                          const SizedBox(
                            width: 05,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: AnimatedIcon(
                              icon: AnimatedIcons.add_event,
                              progress: animation,
                              size: 30,
                              semanticLabel: 'show menu',
                            ),
                          ),
                          const SizedBox(
                            width: 05,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: AnimatedIcon(
                              icon: AnimatedIcons.add_event,
                              progress: animation,
                              size: 30,
                              semanticLabel: 'show menu',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      const Center(child: Text('Create a new account')),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextButton(
                          style: ButtonStyle(
                              fixedSize: MaterialStatePropertyAll(
                                  Size(width / 1.2, height / 19)),
                              backgroundColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: const BorderSide(
                                          width: .5, color: Colors.black)))),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage()));
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
