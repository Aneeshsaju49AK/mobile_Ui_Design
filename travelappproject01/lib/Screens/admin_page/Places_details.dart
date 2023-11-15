import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelapp_project01/hive/model/place_model.dart';

class TreadingPlace01 extends StatefulWidget {
  const TreadingPlace01({super.key});

  @override
  State<TreadingPlace01> createState() => _TreadingPlace01State();
}

class _TreadingPlace01State extends State<TreadingPlace01> {
  late Box<PlaceModel> placeBox;

  @override
  void initState() {
    super.initState();
    placeBox = Hive.box<PlaceModel>('places');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Container(
        height: height / 1,
        width: width / 1,
        child: ValueListenableBuilder(
          valueListenable: placeBox.listenable(),
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: placeBox.length,
              itemBuilder: (context, index) {
                final place = placeBox.getAt(index) as PlaceModel;

                return Container(
                  width: width / 1,
                  height: height / 2,
                  child: Column(
                    children: [
                      Text('District:${place.district}'),
                      Text('Category ${place.category}'),
                      Text('Place Name: ${place.placeName}'),
                      Text('desription: ${place.description}'),
                      Column(
                        children: place.images.map((imagePath) {
                          return Image.file(
                            File(imagePath),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          );
                        }).toList(),
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTreading()));
          },
          label: const Text('ADD')),
    );
  }
}

class AddTreading extends StatefulWidget {
  const AddTreading({super.key});

  @override
  State<AddTreading> createState() => _AddTreadingState();
}

class _AddTreadingState extends State<AddTreading> {
  late Box<PlaceModel> placeBox;
  final _formKey = GlobalKey<FormState>();
  final _districtPlaceController = TextEditingController();
  final _categoryplaceController = TextEditingController();
  final _placeNameController = TextEditingController();
  final _sublocationController = TextEditingController();
  final _directionController = TextEditingController();
  final _descriptionController = TextEditingController();

  int countImage = 0;

  List<String> images = [];
  @override
  void initState() {
    super.initState();
    placeBox = Hive.box<PlaceModel>('places');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                    children: List.generate(countImage, (index) {
                  return Visibility(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        width: width / 1.4,
                        height: height / 6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(),
                            image: DecorationImage(
                                image: index < images.length
                                    ? FileImage(
                                        File(images[index]),
                                      )
                                    : FileImage(
                                        File(''),
                                      ),
                                fit: BoxFit.cover)),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              images.removeAt(index);
                              countImage--;
                              print(images);
                            });
                          },
                          icon: CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.red,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 12,
                              child: Icon(
                                Icons.remove,
                                color: Colors.red,
                              ),
                            ),
                          ))
                    ],
                  ));
                })),
                SizedBox(
                  height: 12,
                ),
                TextButton.icon(
                    onPressed: () async {
                      await bottomSheet(context).then((value) {
                        setState(() {
                          countImage++;
                        });
                      });
                    },
                    icon: Icon(Icons.add),
                    label: Text('ADD image')),
                // SizedBox(
                //   height: height / 4,
                //   width: width / 1,
                //   child: ListView.builder(
                //     itemCount: 4,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: EdgeInsets.all(8),
                //         child: GestureDetector(
                //           onTap: () {
                //             bottomSheet(context);
                //           },
                //           child: Container(
                //             height: height / 10,
                //             width: width / 2,
                //             decoration: BoxDecoration(
                //               border: Border.all(width: 1),
                //             ),
                //             child: _treadingPicturePath != null
                //                 ? Image(
                //                     image:
                //                         FileImage(File(_treadingPicturePath!)))
                //                 : const Center(
                //                     child: Icon(Icons.add),
                //                   ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    controller: _districtPlaceController,
                    decoration: const InputDecoration(
                      labelText: 'Place District',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the palace District';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    controller: _categoryplaceController,
                    decoration: const InputDecoration(
                      labelText: 'Place Category',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the place category';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    controller: _placeNameController,
                    decoration: const InputDecoration(
                      labelText: 'PlaceName or location',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the PlaceName or location';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    controller: _sublocationController,
                    decoration: const InputDecoration(
                      labelText: 'Sub Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Sub Name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    controller: _directionController,
                    decoration: const InputDecoration(
                      labelText: 'Get direction',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the get direction';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    maxLines: null, // Allow it to expand as needed
                    minLines: 3,
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the Description';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final district = _districtPlaceController.text;
                            final category = _categoryplaceController.text;
                            final placeName = _placeNameController.text;
                            final subLocation = _sublocationController.text;
                            final direction = _directionController.text;
                            final description = _descriptionController.text;

                            final place = PlaceModel(
                                district: district,
                                category: category,
                                placeName: placeName,
                                subLocation: subLocation,
                                googleMapsPath: direction,
                                description: description,
                                images: images);

                            placeBox.add(place);

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('User added successfully'),
                              backgroundColor: Colors.green[200],
                              duration: const Duration(seconds: 3),
                            ));
                            Navigator.pop(context);
                          }
                        },
                        icon: const Icon(Icons.save),
                        label: const Text('Save')),
                    ElevatedButton.icon(
                        onPressed: () async {
                          _districtPlaceController.text = '';
                          _categoryplaceController.text = '';
                          _placeNameController.text = '';
                          _sublocationController.text = '';
                          _directionController.text = '';
                          _descriptionController.text = '';
                        },
                        icon: const Icon(Icons.save),
                        label: const Text('clear')),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future bottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: .4,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Select the image source:',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      XFile? img = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      setState(() {
                        images.add(img!.path);
                      });

                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.camera,
                    ),
                    label: const Text(
                      'Camera',
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      XFile? img = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      setState(() {
                        images.add(img!.path);
                      });

                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.image,
                    ),
                    label: const Text(
                      'Gallery',
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
