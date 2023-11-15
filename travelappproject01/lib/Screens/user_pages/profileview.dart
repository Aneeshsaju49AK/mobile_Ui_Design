import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: height / 1,
          width: width / 1,
          color: Colors.amber,
          child: const Coverflow(),
        ),
        Positioned(
          top: 450,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )),
            height: height / 1.5,
            width: width / 1,
            child: DetailsAll(),
          ),
        )
      ],
    ));
  }
}

class Coverflow extends StatefulWidget {
  const Coverflow({super.key});

  @override
  State<Coverflow> createState() => _CoverflowState();
}

class _CoverflowState extends State<Coverflow> {
  var controller = PageController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Image.asset(
                'lib/asset/imges/images (1).png',
                fit: BoxFit.fill,
                height: height / 1,
              ),
              Positioned(
                left: width / 1.1,
                top: height / 8,
                child: SmoothPageIndicator(
                    axisDirection: Axis.vertical,
                    controller: controller,
                    count: 5),
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget DetailsAll() {
  return Padding(
    padding: const EdgeInsets.only(top: 40, left: 10),
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                'Kerala Mountain',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                width: 70,
              ),
              Icon(Icons.heart_broken_rounded)
            ],
          ),
          const Text('Idukki, Kerala'),
          const Text(
            'Overview',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const Text(
            '''biodivesity.As the waterfall is situated
deep inside the silent valley, it is blessed
with a pleasent and clam ambience, The
place offers a scenic view of the surrounding''',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  style: const ButtonStyle(),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.flag),
                      Text(
                        'Get Direction',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    ),
  );
}

// Widget Coverflow(PageController controller) {
//   return Stack(
//     children: [
//       PageView(
//         children: [
//           myPageWidgetPotrait04(controller),
//           // myPage05Wideget(),
//         ],
//       )
//     ],
//   );
// }

// Widget myPageWidgetPotrait04(PageController controller) {
//   return ListView.builder(
//     scrollDirection: Axis.horizontal,
//     shrinkWrap: true,
//     itemCount: 05,
//     itemBuilder: (context, index) {
//       return Container(
//         decoration: BoxDecoration(
//             border: Border.symmetric(),
//             borderRadius: BorderRadiusDirectional.all(Radius.circular(10))),
//         height: 400,
//         width: 400,
//         child: Stack(
//           children: [
//             Image.asset('lib/imges/pexels-photo-1548693.jpeg'),
//             Positioned(
//                 top: 50,
//                 left: 20,
//                 child: InkWell(
//                   onTap: () => Navigator.pop(context),
//                   child: Icon(
//                     Icons.backspace,
//                     color: Colors.white,
//                   ),
//                 )),
//             Positioned(
//                 top: 140,
//                 child: Text(
//                   'Kerala',
//                   style: TextStyle(color: Colors.white),
//                 )),
//             Positioned(
//               top: 120,
//               child: SmoothPageIndicator(
//                 controller: controller,
//                 count: 5,
//                 effect: WormEffect(
//                   dotColor: Colors.red,
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     },
//   );
// }
