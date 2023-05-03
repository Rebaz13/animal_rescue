import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/animal_modal.dart';

class AnimalListPage extends StatefulWidget {
  @override
  _AnimalListPageState createState() => _AnimalListPageState();
}

class _AnimalListPageState extends State<AnimalListPage> {
  final CollectionReference _animalsRef =
      FirebaseFirestore.instance.collection('animals');
  List<AnimalModel> _animals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _animalsRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          // Get a list of AnimalModel objects from the Firestore documents
          _animals = snapshot.data!.docs
              .map((doc) =>
                  AnimalModel.fromJson({'id': doc.id, ...doc.data() as Map}))
              .toList();

          return ListView.builder(
            itemCount: _animals.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_animals[index].name),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AnimalListScreen()));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
