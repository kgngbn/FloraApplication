import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_drawer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/model.dart';
import 'details.dart';

final storage = FirebaseStorage.instance;
final storageRef = FirebaseStorage.instance.ref();
final flora = <Flora>[];

Reference getImage(String fileName) {
  return storageRef.child(fileName);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Flora> floraItems = [];
  String filterText = '';

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
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    List<Flora> filteredFlora = filterFloraItems(); // Get the filtered list

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FLORA',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.brown.shade50,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  filterText = value; // Update the filter text input
                });
              },
              decoration: InputDecoration(
                hintText: 'Find a Plant',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintStyle: GoogleFonts.poppins(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFlora.length,
              itemBuilder: (context, index) {
                final floraItem = filteredFlora[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      floraItem.name,
                      style: GoogleFonts.poppins(),
                    ),
                    subtitle: Text(
                      floraItem.scientificName,
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    leading: Image.network(
                      floraItem.imageUrl,
                      width: 100, // Set a fixed width for the image
                      height: 100, // Set a fixed height for the image
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            imageUrl: floraItem.imageUrl,
                            title: floraItem.name,
                            subtitle: floraItem.scientificName,
                            description: floraItem.description,
                            addToFavorites: addToFavorites,
                            removeFromFavorites: removeFromFavorites,
                            isFavorite: isFavorite(floraItem.name),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(
        favoritePlants: favoritePlants,
        removeFromFavorites: removeFromFavorites,
        addToFavorites: addToFavorites,
      ),
    );
  }

  List<Flora> filterFloraItems() {
    if (filterText.isEmpty) {
      return floraItems; // Return all items if the filter text is empty
    } else {
      // Filter the items based on the filter text
      return floraItems.where((flora) {
        final name = flora.name.toLowerCase();
        final scientificName = flora.scientificName.toLowerCase();
        final filterLowercase = filterText.toLowerCase();
        return name.contains(filterLowercase) ||
            scientificName.contains(filterLowercase);
      }).toList();
    }
  }

  Future<void> fetchData() async {
    // flora.clear();
    print('fetching data');
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('flora').get();

      List<Flora> tempList = [];

      querySnapshot.docs.forEach((doc) {
        print(doc);
        final flora = Flora(
          name: doc["name"],
          scientificName: doc["scientificName"],
          imageUrl: doc["imageUrl"],
          description: doc["description"],
          websiteUrl: null,
          id: null,
        );
        // FloraProvider.of(context).add(flora);
        tempList.add(flora);
      });
      setState(() {
        floraItems.addAll(tempList);
      });
    } catch (e) {
      print('Error fetching flora: $e');
    }

    // print('Fetched ${flora.length} flora');
  }
}
