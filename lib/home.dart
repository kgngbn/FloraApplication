import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'app_drawer.dart';
import 'textfield.dart';
import 'details.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FirebaseStorage storage;
  late Reference ref;
  late UploadTask uploadTask;
  String url = '';

  @override
  void initState() {
    super.initState();
    storage = FirebaseStorage.instance;
    ref = storage
        .ref()
        .child('images/image_${DateTime.now().millisecondsSinceEpoch}.jpg');
  }

  File? imageFile;

  Future<void> getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade900,
        title: Text('FLORA',
            style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.brown.shade50)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HomeScreenTextField(),
          Expanded(
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            title: 'Bears Breeches',
                            imageUrl: url,
                            subtitle: ''),
                      ),
                    );
                  },
                  child: _buildItem('Bears Breeches', 'Acanthus balanicus',
                      'images/bearsbreeches.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            title: 'Green Chirett',
                            imageUrl: url,
                            subtitle: ''),
                      ),
                    );
                  },
                  child: _buildItem('Green Chiretta / Serpentina',
                      'Andrographis paniculate', 'images/serpentina.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            title: 'Zebra Plant', imageUrl: url, subtitle: ''),
                      ),
                    );
                  },
                  child: _buildItem('Zebra Plant', 'Aphelandra squarrosa',
                      'images/zebraplant.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            title: 'Chinese Violet',
                            imageUrl: url,
                            subtitle: ''),
                      ),
                    );
                  },
                  child: _buildItem('Chinese Violet', 'Asystasia gangetica',
                      'images/chineseviolet.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            title: 'Api Api Putih / Bungalon',
                            imageUrl: url,
                            subtitle: ''),
                      ),
                    );
                  },
                  child: _buildItem('Api Api Putih / Bungalon',
                      'Avicennia alba', 'images/bungalon.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            title: 'Grey Barleria',
                            imageUrl: url,
                            subtitle: ''),
                      ),
                    );
                  },
                  child: _buildItem('Grey Barleria ', 'Barleria albostellata',
                      'images/barleria.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                            title: 'Peristrophe', imageUrl: url, subtitle: ''),
                      ),
                    );
                  },
                  child: _buildItem('Peristrophe', 'Dicliptera inaequalis',
                      'images/peristrophe.jpg'),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }

  Widget _buildItem(String title, String description, String imagePath) {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.brown[100],
        boxShadow: [
          BoxShadow(
            color: Colors.brown[900]!.withOpacity(0.5),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
