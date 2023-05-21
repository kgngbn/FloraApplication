// import 'dart:io';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
import 'app_drawer.dart';
import 'models/model.dart';
import 'textfield.dart';
import 'details.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HomeScreenTextField(),
          Expanded(
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          flora: Flora(
                              name: 'Bears Breeches',
                              scientificName: 'Acanthus balanicus',
                              imageUrl:
                                  'https://images.unsplash.com/photo-1672577865165-17c4897cfecc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmVhcnMlMjBicmVlY2hlc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=1000&q=60',
                              description:
                                  'Acanthus hungaricus  (Acanthus balcanicus). Handsome and stately with dense clumps of deeply lobed leaves and stiff spikes densely packed with four rows of purple shrouded pale pink flowers. The cross shaped arrangement of the flowers is particularly noticeable with the flowers stacked vertically in neat rows.The foliage is a pale green with narrow lobes that are continuous along the stem between each lobe. Well drained soil in full sun is best but I have been told that this is the best of the Acanthus for shade. Height between 90 & 150cm.'),
                        ),
                      ),
                    );
                  },
                  child: _buildItem('Bears Breeches', 'Acanthus balanicus',
                      'https://images.unsplash.com/photo-1672577865165-17c4897cfecc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmVhcnMlMjBicmVlY2hlc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=1000&q=60'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          flora: Flora(
                              name: 'Green Chiretta / Serpentina',
                              scientificName: 'Andrographis paniculate',
                              imageUrl:
                                  'https://upload.wikimedia.org/wikipedia/commons/3/39/Andrographis_paniculata_%28Kalpa%29_in_Narshapur_forest%2C_AP_W2_IMG_0867.jpg',
                              description:
                                  'Andrographis paniculata is a widely used medicinal plant known for treating various ailments. It contains diverse bioactive compounds and has shown promising pharmacological activities. This review summarizes its medicinal uses, phytochemistry, pharmacology, and toxicity profile based on extensive research. The plant exhibits antimicrobial, anti-inflammatory, antioxidant, and other beneficial effects. Although acute toxicity studies have shown no significant adverse effects, more research is required for a thorough understanding of its toxicity on mammalian tissues and organs.'),
                        ),
                      ),
                    );
                  },
                  child: _buildItem(
                      'Green Chiretta / Serpentina',
                      'Andrographis paniculate',
                      'https://upload.wikimedia.org/wikipedia/commons/3/39/Andrographis_paniculata_%28Kalpa%29_in_Narshapur_forest%2C_AP_W2_IMG_0867.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          flora: Flora(
                              name: 'Zebra Plant',
                              scientificName: 'Aphelandra squarrosa',
                              imageUrl:
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/AphelandraSquarrosa.jpg/1200px-AphelandraSquarrosa.jpg',
                              description:
                                  'Aphelandra squarrosa is a plant known for its vibrant and eye-catching appearance. Belonging to the Acanthaceae family, it is commonly referred to as Zebra Plant due to its unique striped foliage. Native to the tropical regions of Central and South America, this plant is popular for its ornamental value and is often cultivated as a houseplant. Aphelandra squarrosa produces tall spikes of colorful bracts that surround small yellow flowers, adding a splash of color to any indoor space. It is admired for its lush green leaves adorned with bold white stripes, resembling the patterns found on a zebra. This plant thrives in warm and humid conditions and requires regular watering and indirect sunlight to maintain its vibrant appearance. With its striking foliage, Aphelandra squarrosa is a favorite choice among plant enthusiasts and adds a touch of exotic beauty to any botanical collection or interior décor.'),
                        ),
                      ),
                    );
                  },
                  child: _buildItem('Zebra Plant', 'Aphelandra squarrosa',
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/AphelandraSquarrosa.jpg/1200px-AphelandraSquarrosa.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          flora: Flora(
                              name: 'Chinese Violet',
                              scientificName: 'Asystasia gangetica',
                              imageUrl:
                                  'https://upload.wikimedia.org/wikipedia/commons/f/f4/Starr_011104_0065_asystasia_gangetica.jpg',
                              description:
                                  'Asystasia gangetica, commonly known as Chinese Violet, is a versatile flowering plant belonging to the Acanthaceae family. Native to tropical regions of Asia and Africa, it is cherished for its delicate beauty and ability to thrive in various environments. Chinese Violet features slender stems with glossy green leaves that create an elegant backdrop for its charming blossoms. The flowers, typically lavender or purple in color, bloom in clusters and exhibit a trumpet-like shape with a contrasting white or yellow throat. This plant is known for its ability to attract pollinators, such as bees and butterflies, due to its nectar-rich blooms. Chinese Violet is well-suited for both indoor and outdoor cultivation, making it a popular choice for gardens, landscapes, and as a potted plant. It requires moderate watering and partial sun to flourish, but can also tolerate shade and drier conditions. With its graceful appearance and ability to add a touch of color to any setting, Asystasia gangetica is a delightful addition to botanical collections and gardens alike.'),
                        ),
                      ),
                    );
                  },
                  child: _buildItem('Chinese Violet', 'Asystasia gangetica',
                      'https://upload.wikimedia.org/wikipedia/commons/f/f4/Starr_011104_0065_asystasia_gangetica.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          flora: Flora(
                              name: 'Api Api Putih / Bungalon',
                              scientificName: 'Avicennia alba',
                              imageUrl:
                                  'https://upload.wikimedia.org/wikipedia/commons/8/84/Avicennia_alba.jpg',
                              description:
                                  'Avicennia alba, also known as Api Api Putih or Bungalon, is a coastal mangrove tree native to tropical Asia. It features glossy green leaves, a grayish-white bark, and a complex root system with pneumatophores. This adaptable species plays a vital role in coastal protection, providing habitat for marine life and acting as a natural buffer against storms. Avicennia alba is also used in traditional medicine for its antiseptic and anti-inflammatory properties. It is a resilient and ecologically significant tree with cultural and aesthetic value.'),
                        ),
                      ),
                    );
                  },
                  child: _buildItem(
                      'Api Api Putih / Bungalon',
                      'Avicennia alba',
                      'https://upload.wikimedia.org/wikipedia/commons/8/84/Avicennia_alba.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          flora: Flora(
                              name: 'Grey Barleria',
                              scientificName: 'Barleria albostellata',
                              imageUrl:
                                  'https://upload.wikimedia.org/wikipedia/commons/c/cb/Barleria_albostellata%2C_b%2C_Ou_Fort%2C_Durban.jpg',
                              description:
                                  'Barleria albostellata, commonly known as Grey Barleria, is a flowering plant that belongs to the Acanthaceae family. It is native to tropical regions of Asia and Africa. This plant features distinctive greyish-green leaves and produces vibrant purple or pink flowers. Grey Barleria is known for its ornamental value and is often cultivated in gardens and landscapes for its attractive blooms. It thrives in warm climates and is adaptable to various soil conditions. The plant is also utilized in traditional medicine for its potential medicinal properties, including anti-inflammatory and antibacterial effects. With its unique appearance and potential health benefits, Grey Barleria is a noteworthy addition to botanical collections and horticultural settings.'),
                        ),
                      ),
                    );
                  },
                  child: _buildItem('Grey Barleria ', 'Barleria albostellata',
                      'https://upload.wikimedia.org/wikipedia/commons/c/cb/Barleria_albostellata%2C_b%2C_Ou_Fort%2C_Durban.jpg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          flora: Flora(
                              name: 'Peristrophe',
                              scientificName: 'Dicliptera inaequalis',
                              imageUrl:
                                  'https://inaturalist-open-data.s3.amazonaws.com/photos/53413829/original.jpg',
                              description:
                                  'Dicliptera inaequalis is a species of flowering plant in the Acanthaceae family. Commonly known as Peristrophe, it is native to tropical regions of Asia and Africa. This plant is characterized by its slender stems, lance-shaped leaves, and clusters of small tubular flowers. Peristrophe is highly valued for its ornamental qualities and is often grown in gardens and landscapes for its vibrant and colorful blooms. It prefers warm climates and well-drained soil. In traditional medicine, certain parts of the plant are used for their potential medicinal properties, including anti-inflammatory and antioxidant effects. With its graceful appearance and potential health benefits, Peristrophe is a captivating choice for botanical enthusiasts and gardening enthusiasts alike.'),
                        ),
                      ),
                    );
                  },
                  child: _buildItem('Peristrophe', 'Dicliptera inaequalis',
                      'https://inaturalist-open-data.s3.amazonaws.com/photos/53413829/original.jpg'),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }

  Widget _buildItem(String title, String description, String imageUrl) {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.brown[100],
        boxShadow: [
          BoxShadow(
            color: Colors.brown[900]!.withOpacity(0.5),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
