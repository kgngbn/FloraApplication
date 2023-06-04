import 'package:flutter/material.dart';
import 'package:flutter_layout/text_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_drawer.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> favoritePlants = []; // Initialize the list of favorite plants

  void addToFavorites(String plantName) {
    setState(() {
      favoritePlants.add(plantName);
    });
  }

  void removeFromFavorites(String plantName) {
    setState(() {
      favoritePlants.remove(plantName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BasicScreen(
        favoritePlants: favoritePlants,
        addToFavorites: addToFavorites,
        removeFromFavorites: removeFromFavorites,
      ),
    );
  }
}

class BasicScreen extends StatelessWidget {
  final List<String> favoritePlants;
  final Function(String) addToFavorites;
  final Function(String) removeFromFavorites;

  BasicScreen({
    required this.favoritePlants,
    required this.addToFavorites,
    required this.removeFromFavorites,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade900,
        title: Text('FLORA',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.brown.shade50)),
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
          Image.asset('assets/Flora.png'),
          TextLayout(),
        ],
      ),
      drawer: AppDrawer(
        favoritePlants: favoritePlants,
        removeFromFavorites: removeFromFavorites,
        addToFavorites: addToFavorites,
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
