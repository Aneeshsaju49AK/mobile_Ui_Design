import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelapp_project01/hive/model/user_model.dart';

class EditProfile extends StatefulWidget {
  final Function() incrementUserCount;
  EditProfile({super.key, required this.incrementUserCount});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late Box<UserProfile> userBox;
  @override
  void initState() {
    super.initState();
    userBox = Hive.box<UserProfile>('userProfile');
  }

  final _formKey = GlobalKey<FormState>();
  final _UserNameController = TextEditingController();
  final _UserEmailController = TextEditingController();
  final _UserUserNameController = TextEditingController();
  String? _profilePicturePath;
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: editProfile(
          context,
        ),
      ),
    ));
  }

  Widget editProfile(context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.backspace)),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                bottomSheet(context);
              },
              child: CircleAvatar(
                radius: 80,
                backgroundImage: _profilePicturePath != null
                    ? FileImage(File(_profilePicturePath!))
                    : null,
                child: _profilePicturePath == null
                    ? Icon(Icons.add_a_photo)
                    : null,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: width / 1.2,
              height: height / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    controller: _UserNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      label: const Text('Name'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Name';
                      }
                      return null;
                    },
                  ),
                  const Text('Email',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
                  TextFormField(
                    controller: _UserEmailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      label: const Text('Email'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the Email';
                      }
                      return null;
                    },
                  ),
                  Text('User Name',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
                  TextFormField(
                    controller: _UserUserNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(40)),
                      label: Text('User Name'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your UserName';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blue)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final name = _UserNameController.text;
                              final email = _UserEmailController.text;
                              final userName = _UserUserNameController.text;

                              final usermodel = UserProfile(
                                name: name,
                                email: email,
                                userName: userName,
                                profilePicturepath: _profilePicturePath,
                              );

                              userBox.add(usermodel);
                              widget.incrementUserCount();

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Text('User added successfully'),
                                backgroundColor: Colors.green[200],
                                duration: const Duration(seconds: 3),
                              ));
                              Navigator.pop(context);
                            }
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Save',
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(
                        width: 50,
                      ),
                      TextButton.icon(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red),
                          ),
                          onPressed: () async {
                            _UserNameController.text = '';
                            _UserEmailController.text = '';
                            _UserUserNameController.text = '';
                          },
                          icon: const Icon(Icons.delete, color: Colors.white),
                          label: const Text('Clear',
                              style: TextStyle(color: Colors.white)))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bottomSheet(BuildContext context) {
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
                        image = img;
                      });
                      _profilePicturePath = image!.path;
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
                        image = img;
                      });
                      _profilePicturePath = image!.path;
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
