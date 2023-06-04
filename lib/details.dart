import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteScreen extends StatelessWidget {
  final List<String> favoritePlants;
  final Function(String) removeFromFavorites;

  FavoriteScreen({
    required this.favoritePlants,
    required this.removeFromFavorites,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.brown.shade50,
          ),
        ),
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
            onTap: () {
              // Navigate to plant details screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PlantDetailsScreen(plantName: plantName),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PlantDetailsScreen extends StatefulWidget {
  final String plantName;

  PlantDetailsScreen({required this.plantName});

  @override
  _PlantDetailsScreenState createState() => _PlantDetailsScreenState();
}

class _PlantDetailsScreenState extends State<PlantDetailsScreen> {
  bool isFavorite = false;
  String imageUrl = '';
  String subtitle = '';
  String description = '';

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPlantDetails();
  }

  void fetchPlantDetails() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('plants')
          .doc(widget.plantName)
          .get();
      setState(() {
        imageUrl = doc['imageUrl'];
        subtitle = doc['subtitle'];
        description = doc['description'];
      });
    } catch (e) {
      print('Error fetching plant details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Plant Details',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.brown.shade50,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(imageUrl),
          SizedBox(height: 16),
          Text(
            widget.plantName,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            subtitle,
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: GoogleFonts.poppins(fontSize: 12),
          ),
          SizedBox(height: 16),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: toggleFavorite,
          ),
        ],
      ),
    );
  }
}
