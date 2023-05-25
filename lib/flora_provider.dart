import 'package:flutter/material.dart';
import './models/model.dart';

class FloraProvider extends InheritedWidget {
  final List<Flora> flora = [];

  FloraProvider({Key? key, Widget? child}) : super(key: key, child: child!);

  // Future<void> fetchData() async {
  //   flora.clear();
  //   try {
  //     QuerySnapshot querySnapshot =
  //         await FirebaseFirestore.instance.collection('flora').get();

  //     querySnapshot.docs.forEach((doc) {
  //       final flora = Flora(
  //         name: doc["name"],
  //         scientificName: doc["scientificName"],
  //         imageUrl: doc["imageUrl"],
  //         description: doc["description"],
  //       );
  //       flora.add(flora);
  //     });
  //   } catch (e) {
  //     print('Error fetching flora: $e');
  //   }

  //   print('Fetched ${flora.length} flora');
  // }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static List<Flora> of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<FloraProvider>();
    return provider!.flora;
  }
}
