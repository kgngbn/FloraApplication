import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;
  final Function(String) addToFavorites;
  final Function(String) removeFromFavorites;
  final bool isFavorite;

  const DetailsScreen({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.addToFavorites,
    required this.removeFromFavorites,
    required this.isFavorite,
  });

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        widget.addToFavorites(widget.title);
      } else {
        widget.removeFromFavorites(widget.title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(widget.imageUrl),
          SizedBox(height: 16),
          Text(
            widget.title,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            widget.subtitle,
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            widget.description,
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
