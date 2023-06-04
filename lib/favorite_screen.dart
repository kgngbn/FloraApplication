import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<String> favoritePlants = [];

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

  bool isFavorite(String plantName) {
    return favoritePlants.contains(plantName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.brown.shade50)),
      ),
      body: ListView.builder(
        itemCount: favoritePlants.length,
        itemBuilder: (context, index) {
          final plantName = favoritePlants[index];
          return ListTile(
            title: Text(
              plantName,
              style: GoogleFonts.poppins(),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {
                removeFromFavorites(plantName);
              },
            ),
          );
        },
      ),
    );
  }
}
