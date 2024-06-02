class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description',
      image: json['images'] != null && (json['images'] as List).isNotEmpty ? json['images'][0] : 'https://via.placeholder.com/150',
      price: (json['price'] ?? 0).toDouble(),
    );
  }
}
