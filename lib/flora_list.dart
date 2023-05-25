// import 'package:flutter/material.dart';
// import 'app_drawer.dart';
// import 'flora_provider.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('FLORA'),
//           leading: Builder(
//             builder: (BuildContext context) {
//               return IconButton(
//                 icon: Icon(Icons.menu),
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//               );
//             },
//           ),
//         ),
//         drawer: AppDrawer(),
//         body: FloraList());
//   }
// }

// class FloraList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final floraProvider = FloraProvider.of(context);
//     return FutureBuilder<void>(
//       future: floraProvider?.fetchData(),
//       builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasError) {
//           print(snapshot.error);
//           return Center(
//             child: Text('Error fetching flora'),
//           );
//         } else {
//           final floras = floraProvider?.flora;
//           return ListView.builder(
//             itemCount: floras?.length,
//             itemBuilder: (context, index) {
//               final flora = floras?[index];
//               return ListTile(
//                 title: Text(flora!.name),
//                 subtitle: Text(flora.imageUrl),
//                 leading: Image.network(flora.imageUrl),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }
