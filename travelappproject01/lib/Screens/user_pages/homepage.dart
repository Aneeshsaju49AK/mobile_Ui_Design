import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelapp_project01/Screens/user_pages/addtrippage.dart';

import 'package:travelapp_project01/Screens/user_pages/myfavirotes.dart';
import 'package:travelapp_project01/Screens/user_pages/nearby.dart';
import 'package:travelapp_project01/Screens/user_pages/popularcategories.dart';
import 'package:location/location.dart';
import 'package:travelapp_project01/Screens/user_pages/profileview.dart';
import 'package:travelapp_project01/Screens/user_pages/searchview.dart';
import 'package:travelapp_project01/Screens/user_pages/userprofileedit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelapp_project01/hive/model/user_model.dart';

class MyHomePageMain extends StatefulWidget {
  const MyHomePageMain({super.key});

  @override
  State<MyHomePageMain> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageMain>
    with TickerProviderStateMixin {
  late Box<UserProfile> userBox;

  String? _selectedUserProfilePicturePath;
  String? _username;

  late TabController _tabController;
  GoogleMapController? mapController;

  String address = '';
  LocationData? currentLocation;
  int index = 0;
  int _userCount = 0;

  locationofDevice() async {
    // var serviceEnbled = await location.serviceEnabled();
    // if (!serviceEnbled) {
    //   serviceEnbled = await location.requestService();
    //   if (!serviceEnbled) {
    //     return;
    //   }
    // }
  }
  void incrementUserCount() {
    setState(() {
      _userCount++;
    });
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    getCurrentLocation();
    locationofDevice();
    getLocation();

    userBox = Hive.box<UserProfile>('userProfile');
  }

  getCurrentLocation() async {
    try {} catch (e) {
      print('Error getting location: $e');
    }
    if (mounted) {
      setState(() {});
    }
  }

  getLocation() async {
    Position position;

    try {
      position = await Geolocator.getCurrentPosition();
      List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemark[0];
      setState(() {
        address = "${place.locality}";
      });
    } catch (e) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Sidebar(
                                          context,
                                        )));
                          },
                          child: ValueListenableBuilder(
                            valueListenable: userBox.listenable(),
                            builder: (context, value, child) {
                              // Convert the Iterable<UserProfile> to List<UserProfile>
                              final List<UserProfile> userProfileList =
                                  userBox.values.toList();

                              // You can display the values by iterating through the list
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: userProfileList.map((userProfile) {
                                  _selectedUserProfilePicturePath =
                                      userProfile.profilePicturepath;
                                  _username = userProfile.userName;

                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage:
                                            _selectedUserProfilePicturePath !=
                                                    null
                                                ? FileImage(File(
                                                    _selectedUserProfilePicturePath!))
                                                : null,
                                        child:
                                            _selectedUserProfilePicturePath ==
                                                    null
                                                ? Icon(Icons.add_a_photo)
                                                : null,
                                      ),
                                      Text(
                                        'Welcome back',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        ' $_username',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      // Add more widgets to display other UserProfile properties
                                    ],
                                  );
                                }).toList(),
                              );
                            },
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            ' ${_username}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 90,
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 20,
                            child: address.isNotEmpty
                                ? Icon(
                                    Icons.map_sharp,
                                    color: Colors.blue[600],
                                  )
                                : const CircularProgressIndicator(),
                          ),
                          Text(address),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: width / 1,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Life is Journey',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 22),
                        ),
                        Text(
                          'Make the best of it',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SearchBar(context),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                      height: height / 3,
                      child: Tabviews(_tabController, context)),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: width / 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height / 3.9,
                        width: width / 1,
                        child: SilderView(),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30, left: 10, bottom: 0),
                        child: Text(
                          'Popular Categories',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 4,
                        child: PopularCategories(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: SizedBox(
          height: 60,
          child: NaveBar(context),
        ));
  }

  Widget Sidebar(
    context,
  ) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: width / 1.7,
              height: height / 1,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 150, top: 20),
                      child: SizedBox(
                        height: 20,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.backspace,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ValueListenableBuilder(
                      valueListenable: userBox.listenable(),
                      builder: (context, value, child) {
                        final userProfile = userBox.get(_userCount);

                        if (userProfile != null) {
                          var profilePicturepath;
                          _selectedUserProfilePicturePath =
                              userProfile.profilePicturepath;
                          _username = userProfile.userName;
                        } else {
                          _selectedUserProfilePicturePath =
                              'lib/asset/imges/pexels-photo-1770809.jpeg';
                          _username = 'ak';
                        }

                        return Container(
                            width: 200,
                            height: 152,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        _selectedUserProfilePicturePath != null
                                            ? FileImage(File(
                                                _selectedUserProfilePicturePath!))
                                            : null,
                                    child:
                                        _selectedUserProfilePicturePath == null
                                            ? const Icon(Icons.add_a_photo)
                                            : null,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    ' ${userProfile?.name ?? ''}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    ' ${userProfile?.email ?? ''}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                    ),
                    SizedBox(
                      width: width / 1,
                      height: height / 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35, top: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Home',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditProfile(
                                                incrementUserCount:
                                                    incrementUserCount,
                                              )));
                                },
                                child: const Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'About',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )),
                            TextButton(
                                onPressed: () {
                                  _logOutUser(context);
                                },
                                child: const Text(
                                  'LogOut',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget NaveBar(context) {
  return ConvexAppBar(
    items: const [
      TabItem(
        icon: Icons.home,
        title: 'Home',
      ),
      TabItem(icon: Icons.map, title: 'Discovery'),
      TabItem(icon: Icons.add, title: 'Add'),
      TabItem(icon: Icons.message, title: 'Message'),
      TabItem(icon: Icons.people, title: 'Profile'),
    ],
    onTap: (int index) {
      switch (index) {
        case 0:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyHomePageMain()));
          break;
        case 1:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MySearchBar()));
          break;
        case 2:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTripPage()));
          break;
        case 3:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NearByPage()));
          break;
        case 4:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyFavirotes()));
          break;
      }
    },
  );
}

// class Sidebar extends StatefulWidget {
//   const Sidebar({super.key});

//   @override
//   State<Sidebar> createState() => _SidebarState();
// }

// class _SidebarState extends State<Sidebar> {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     var weight = size.width;
//     var height = size.height;

//     void _accept() {
//       Navigator.pop(context, true); // dialog returns true
//     }

//     return Scaffold(
//       body: Drawer(
//         width: weight / 1.5,
//         child: ListView(
//           children: [
//             InkWell(
//               onTap: _accept,
//               child: DrawerHeader(
//                 decoration: BoxDecoration(color: Colors.amber),
//                 child: Stack(
//                   children: [
//                     Icon((Icons.backpack)),
//                     CircleAvatar(
//                       radius: 50,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text('o1'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

Widget SilderView() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: 1,
    itemBuilder: (context, index) {
      return CarouselSlider.builder(
        itemCount: 5,
        itemBuilder: (context, index, realIndex) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                      image: AssetImage('lib/asset/imges/images (1).png'),
                      fit: BoxFit.cover),
                ),
              ),
              const Positioned(
                  top: 100,
                  left: 10,
                  child: Text(
                    'Woderfull',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          );
        },
        options: CarouselOptions(
          height: 190,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      );
    },
  );
}

Widget PopularCategories() {
  return ListView.builder(
    itemCount: 5,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 60),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PopularCategoriesPage()));
            },
            child: const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('lib/asset/imges/images (1).png'),
              child: Text('hjjf'),
            ),
          ));
    },
  );
}

Widget SearchBar(context) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 0),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            label: const Text(
              'Search for the Destinations',
            ),
            prefixIcon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MySearchBar()));
                },
                icon: const Icon(Icons.search)),
            suffixIcon: const Icon(Icons.file_copy)),
      ),
    ),
  );
}

Widget Tabviews(TabController tabController, context) {
  var size = MediaQuery.of(context).size;
  var height = size.height;
  var width = size.width;
  return Column(
    children: [
      SizedBox(
        width: width / 1,
        height: height / 19,
        child: TabBar(
            labelColor: Colors.black,
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            controller: tabController,
            tabs: const [
              Tab(
                text: 'Most Popular',
              ),
              Tab(
                text: 'Recommended',
              ),
              Tab(
                text: 'Trending',
              )
            ]),
      ),
      Expanded(
        child: TabBarView(
          controller: tabController,
          children: [
            Container(
              child: MyListView01(),
            ),
            Container(child: MyListView01()),
            Container(child: MyListView01()),
          ],
        ),
      ),
    ],
  );
}

Widget MyListView01() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.only(left: 05),
    itemCount: 05,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileView()));
          },
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(10))),
            height: 200,
            width: 130,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                Image.asset(
                  'lib/asset/imges/images (1).png',
                  fit: BoxFit.cover,
                ),
                const Positioned(
                    top: 40,
                    child: Text(
                      'Kerala',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      );
    },
  );
}

void _logOutUser(context) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLoggedIn', false);

  Navigator.of(context).pushNamedAndRemoveUntil(
    'LoginPage',
    (route) => false,
  );
}
