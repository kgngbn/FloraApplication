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

class PlantDetailsScreen extends StatelessWidget {
  final String plantName;

  PlantDetailsScreen({required this.plantName});

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchPlantDetails() async {
    // Fetch plant details from Firebase using the plantName
    final snapshot = await FirebaseFirestore.instance
        .collection('plants')
        .doc(plantName)
        .get();
    return snapshot;
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
      body: FutureBuilder(
        future: fetchPlantDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error occurred'));
          } else if (snapshot.hasData) {
            final plantData = snapshot.data!.data() as Map<String, dynamic>;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    plantData['name'],
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    plantData['description'],
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
