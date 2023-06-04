import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String description;

  const DetailsScreen({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLORA',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.brown.shade50)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(widget.imageUrl),
          SizedBox(height: 16),
          Text(
            widget.title,
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
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
