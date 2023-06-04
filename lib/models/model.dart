class Flora {
  final String name;
  final String scientificName;
  final String imageUrl;
  final String description;

  Flora(
      {required this.name,
      required this.scientificName,
      required this.imageUrl,
      required this.description,
      required websiteUrl});

  get websiteUrl => null;

  void add(Flora flora) {}
}
