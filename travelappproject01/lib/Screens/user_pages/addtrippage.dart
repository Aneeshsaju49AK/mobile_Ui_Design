import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:travelapp_project01/Screens/user_pages/searchview.dart';

class AddTripPage extends StatefulWidget {
  const AddTripPage({super.key});

  @override
  State<AddTripPage> createState() => _AddTripPageState();
}

class _AddTripPageState extends State<AddTripPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var weight = size.width;
    var height = size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.backspace),
                    ),
                  ),
                  const Text(
                    'Plan your days',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: height / 1.7,
                width: weight / 1.3,
                child: Stack(
                  children: [
                    Positioned(
                      top: height / 3.5,
                      left: weight / 10,
                      child: const Text(
                        "Let's get started",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Positioned(
                      top: height / 2.3,
                      left: weight / 4,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MakeTripDateScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Add trip'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeTripDate(context) {
  var size = MediaQuery.of(context).size;
  var weight = size.width;
  var height = size.height;
  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: height / 1,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 7,
                fit: FlexFit.loose,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.backspace)),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      'Add Trip',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height / 4,
                width: weight / 1,
                child: const SilderView01(),
              ),
              const SizedBox(
                height: 20,
              ),
              const PlanTripWidget(),
            ],
          ),
        ),
      ),
    ),
  );
}

class MakeTripDateScreen extends StatelessWidget {
  const MakeTripDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: makeTripDate(context), // Reuse the existing widget
    );
  }
}

class SilderView01 extends StatelessWidget {
  const SilderView01({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return CarouselSlider.builder(
          itemCount: 5,
          itemBuilder: (context, index, realIndex) {
            return Stack(
              children: [
                Container(
                  // margin: EdgeInsets.all(6.0),
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
                    'Wonderful',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
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
}

class PlanTripWidget extends StatefulWidget {
  const PlanTripWidget({super.key});

  @override
  _PlanTripWidgetState createState() => _PlanTripWidgetState();
}

class _PlanTripWidgetState extends State<PlanTripWidget> {
  DateTime _dateTime = DateTime.now();
  DateTime _enddateTime = DateTime.now();

  void _showdatepicker() {
    showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2020),
      lastDate: DateTime(2026),
    ).then((value) {
      if (value != null) {
        setState(() {
          _dateTime = value;
          _enddateTime = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var weight = size.width;
    var height = size.height;
    return SizedBox(
      height: height / 1.7,
      width: weight / 1.1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  label: const Text('Name Your Trip'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Select your start trip Date',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: TextButton.icon(
                  onPressed: _showdatepicker,
                  icon: const Icon(Icons.calendar_month),
                  label: const Text('Calendar'),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  label: Text(
                    _dateTime.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Select your end trip Date',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: TextButton.icon(
                  onPressed: _showdatepicker,
                  icon: const Icon(Icons.calendar_month),
                  label: const Text('Calendar'),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  label: Text(
                    _enddateTime.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MySearchBar()));
                },
                icon: const Icon(Icons.description),
                label: const Text('Choose Destination'),
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {},
                  icon: const Icon(Icons.description),
                  label: const Text('Save')),
            ],
          )
        ],
      ),
    );
  }
}
