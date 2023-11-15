import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_project01/Screens/user_pages/loginpage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassWordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isPassword(String password) {
    return RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).+$').hasMatch(password);
  }

  bool _isEmailValid(String email) {
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email);
  }

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

  Future<void> saveUserInfo(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  Future<Map<String, String?>> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    final String? password = prefs.getString('password');
    return {'email': email, 'password': password};
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
                'Create new account',
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
                height: height / 1.6,
                child: Form(
                  key: _formKey,
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
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30)),
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
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10)),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Confirm Password',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _confirmPassWordController,
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
                        padding: const EdgeInsets.only(left: 35),
                        child: TextButton(
                          style: ButtonStyle(
                              fixedSize: MaterialStatePropertyAll(
                                  Size(width / 1.3, height / 19)),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.blue),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: const BorderSide(
                                          width: 1, color: Colors.black)))),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final email = _emailController.text;
                              final password = _passwordController.text;

                              await saveUserInfo(email, password);

                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => MyLoginPage(),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: TextButton(
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                                Size(width / 1.3, height / 19)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(
                                    width: 1, color: Colors.black),
                              ),
                            ),
                          ),
                          onPressed: () async {},
                          child: const Text(
                            'Sign in with Google',
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
