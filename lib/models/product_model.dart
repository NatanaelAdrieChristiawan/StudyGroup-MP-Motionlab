class Product {
  final String imageUrl;
  final String name;
  final double price;
  final String description;

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
  });

  // Factory method untuk konversi dari Map
  factory Product.fromMap(Map<String, String> map) {
    return Product(
      imageUrl: map['imageUrl'] ?? '',
      name: map['name'] ?? '',
      price: double.parse(map['price'] ?? '0 0'),
      description: map['description'] ?? '',
    );
  }
}
