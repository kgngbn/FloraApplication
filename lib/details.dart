import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatelessWidget {
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
          Image.network(imageUrl),
          SizedBox(height: 16),
          Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
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
        ],
      ),
    );
  }
}
