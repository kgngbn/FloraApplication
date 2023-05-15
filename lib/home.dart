// import 'dart:io';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
import 'app_drawer.dart';
import 'models/model.dart';
import 'textfield.dart';
import 'details.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                          flora: Flora(
                              name: 'Bears Breeches',
                              scientificName: 'Acanthus balanicus',
                              imageUrl: 'images/bearsbreeches.jpg',
                              description: 'Description of Bears Breeches'),
                        ),
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
                          flora: Flora(
                              name: 'Green Chiretta / Serpentina',
                              scientificName: 'Andrographis paniculate',
                              imageUrl: 'images/serpentina.jpg',
                              description:
                                  'Description of Green Chiretta / Serpentina'),
                        ),
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
                          flora: Flora(
                              name: 'Zebra Plant',
                              scientificName: 'Aphelandra squarrosa',
                              imageUrl: 'images/zebraplant.jpg',
                              description: 'Description of Zebra Plant'),
                        ),
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
                          flora: Flora(
                              name: 'Chinese Violet',
                              scientificName: 'Asystasia gangetica',
                              imageUrl: 'images/chineseviolet.jpg',
                              description: 'Description of Chinese Violet'),
                        ),
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
                          flora: Flora(
                              name: 'Api Api Putih / Bungalon',
                              scientificName: 'Avicennia alba',
                              imageUrl: 'images/bungalon.jpg',
                              description:
                                  'Description of Api Api Putih / Bungalon'),
                        ),
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
                          flora: Flora(
                              name: 'Grey Barleria',
                              scientificName: '',
                              imageUrl: 'images/greybarleria.jpg',
                              description: 'Description of Grey Barleria'),
                        ),
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
                          flora: Flora(
                              name: 'Peristrophe',
                              scientificName: 'Dicliptera inaequalis',
                              imageUrl: 'images/greybarleria.jpg',
                              description: 'Description of Grey Barleria'),
                        ),
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
