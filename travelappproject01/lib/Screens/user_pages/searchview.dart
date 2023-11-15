import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            SearchBarView(context),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Most Searched Destinations are',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
                width: width / 1,
                height: height / 1,
                child: searchviewDestionations(context)),
          ],
        )),
      ),
    );
  }
}

Widget SearchBarView(context) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 0),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            label: const Text(
              'Search ',
            ),
            prefixIcon:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            suffixIcon: const Icon(Icons.file_copy)),
      ),
    ),
  );
}

Widget searchviewDestionations(context) {
  var size = MediaQuery.of(context).size;
  var height = size.height;
  var width = size.width;
  return ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(18),
        child: Stack(
          children: [
            Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: width / 1,
                height: height / 4,
                child: const Image(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'lib/asset/imges/images (1).png',
                    ))),
            const Row(
              children: [
                Text(
                  'karala',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Icon(
                  Icons.heat_pump_sharp,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      );
    },
  );
}
