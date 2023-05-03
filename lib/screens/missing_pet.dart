import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../api/missing_animal_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/map_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MissingPetUi extends StatefulWidget {
  static const route = 'missing-pet';

  const MissingPetUi({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MissingPetUiState createState() => _MissingPetUiState();
}

final _formKey = GlobalKey<FormState>();
LatLng? _currentLocation;

class _MissingPetUiState extends State<MissingPetUi> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  Future<File> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    return File(pickedFile!.path);
  }

  Future<String> uploadImage(File image) async {
    final Reference storageReference =
        storage.ref().child('images/${DateTime.now().toString()}');
    final UploadTask uploadTask = storageReference.putFile(image);
    final TaskSnapshot downloadUrl = (await uploadTask);
    final String url = await downloadUrl.ref.getDownloadURL();
    return url;
  }

  final _missingPetDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal Rescue'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find Your Missing Pet!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
                child: Column(
              children: [
                Container(
                  height: 200,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.primary),
                  child: IconButton(
                    splashRadius: 2,
                    icon: Icon(
                      Icons.photo_camera_back,
                      size: 42,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      final image = await pickImage();
                      final imageUrl = await uploadImage(image);
                      // Here you can do something with the imageUrl, like display it in an image widget.
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _missingPetDescription,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please write pet Description';
                            }
                            return null;
                          },
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                              labelText: 'Describe the situation'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'location',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Please select the location of the animal',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(height: 16),
                            MapWidget(
                              onLatChange: (LatLng latlng) {
                                _currentLocation = latlng;
                              },
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          height: 80,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  File image = await pickImage();
                                  String imageUrl = await uploadImage(image);

                                  Map<String, dynamic> data = {
                                    'description': _missingPetDescription.text,
                                    'latlng': GeoPoint(
                                        _currentLocation!.latitude,
                                        _currentLocation!.longitude),
                                    'image': imageUrl
                                  };

                                  FirebaseFirestore.instance
                                      .collection('missingPets')
                                      .add(data);
                                }
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        )
                      ],
                    ))
              ],
            )),
          ],
        ),
      ),
    );
  }
}
