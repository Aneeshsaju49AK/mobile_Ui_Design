import 'package:flutter/material.dart';
import 'package:travelapp_project01/Screens/user_pages/loginpage.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            color: Colors.red,
            child: PageView(
              scrollBehavior: const ScrollBehavior(),
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: [
                myPage01Wideget(),
                myPage02Wideget(),
                myPage03Wideget(context),
              ],
            ),
          )),
    );
  }
}

Widget myPage01Wideget() {
  return Scaffold(body: OrientationBuilder(
    builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return myPageWidgetPotrait();
      } else {
        return myPageWidgetLandscape();
      }
    },
  ));
}

Widget myPageWidgetPotrait() {
  return Scaffold(
    body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.asset(
              'lib/asset/imges/images (1).png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350, left: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Let's try ",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Something ",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "New ",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextButton.icon(
                        style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(LinearBorder())),
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_outlined),
                        label: const Text('Swipe')),
                  )
                ],
              ),
            ),
          ],
        )),
  );
}

Widget myPageWidgetLandscape() {
  return Scaffold(
    body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.asset(
              'lib/asset/imges/images (1).png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Let's try ",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "Something ",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "New ",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextButton.icon(
                        style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(LinearBorder())),
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_outlined),
                        label: const Text('Swipe')),
                  )
                ],
              ),
            ),
          ],
        )),
  );
}

Widget myPage02Wideget() {
  return Scaffold(body: OrientationBuilder(
    builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return myPage02WidegetPortrait();
      } else {
        return myPage02WidegetLandscape();
      }
    },
  ));
}

Widget myPage02WidegetPortrait() {
  return Scaffold(
    body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.asset(
              'lib/asset/imges/images (1).png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90, left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "are you",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "bored of ",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "traditional ways",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextButton.icon(
                        style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(LinearBorder())),
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_outlined),
                        label: const Text('Swipe')),
                  )
                ],
              ),
            ),
          ],
        )),
  );
}

Widget myPage02WidegetLandscape() {
  return Scaffold(
    body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.asset(
              'lib/asset/imges/images (1).png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "are you",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "bored of",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "traditional ways",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextButton.icon(
                        style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(LinearBorder())),
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_outlined),
                        label: const Text('Swipe')),
                  )
                ],
              ),
            ),
          ],
        )),
  );
}

Widget myPage03Wideget(BuildContext context) {
  return Scaffold(body: OrientationBuilder(
    builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return myPage03WidegetPortrait(context);
      } else {
        return myPage03WidegetLandscape();
      }
    },
  ));
}

Widget myPage03WidegetPortrait(BuildContext context) {
  return Scaffold(
    body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.asset(
              'lib/asset/imges/images (1).png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "So...are you ",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "excited to ",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "explore ",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextButton.icon(
                        style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(LinearBorder())),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MyLoginPage()));
                        },
                        icon: const Icon(Icons.sign_language_outlined),
                        label: const Text('Sign up')),
                  ),
                ],
              ),
            ),
          ],
        )),
  );
}

Widget myPage03WidegetLandscape() {
  return Scaffold(
    body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.asset(
              'lib/asset/imges/images (1).png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "So...are you",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    " excited to ",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "explore ",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextButton.icon(
                        style: const ButtonStyle(
                            shape: MaterialStatePropertyAll(LinearBorder())),
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_outlined),
                        label: const Text('Swipe')),
                  ),
                ],
              ),
            ),
          ],
        )),
  );
}
