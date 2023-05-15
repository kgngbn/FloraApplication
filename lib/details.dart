import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/model.dart';

class DetailsScreen extends StatelessWidget {
  final Flora flora;

  const DetailsScreen({required this.flora});

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(flora.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              flora.name,
              style: GoogleFonts.poppins(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              flora.scientificName,
              style: GoogleFonts.poppins(
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              flora.description,
              style: GoogleFonts.poppins(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
