import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _scientificNameController =
      TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLORA',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.brown.shade50)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _scientificNameController,
                decoration: InputDecoration(
                  labelText: 'Scientific Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _imageUrlController,
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _addFlower();
              },
              child: Text('Add Flower'),
            ),
          ],
        ),
      ),
    );
  }

  void _addFlower() {
    String name = _nameController.text;
    String scientificName = _scientificNameController.text;
    String imageUrl = _imageUrlController.text;
    String description = _descriptionController.text;

    FirebaseFirestore.instance.collection('flora').add({
      'name': name,
      'scientificName': scientificName,
      'imageUrl': imageUrl,
      'description': description,
    }).then((value) {
      _clearInputFields();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Flower added successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add flower'),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  void _clearInputFields() {
    _nameController.clear();
    _scientificNameController.clear();
    _imageUrlController.clear();
    _descriptionController.clear();
  }
}
