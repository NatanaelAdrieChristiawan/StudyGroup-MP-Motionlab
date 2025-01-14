class Product {
  final String imageUrl;
  final String name;
  final double price;
  final String description;
  bool isLiked; // Tambahkan properti isLiked

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
    this.isLiked = false, // Nilai default adalah false
  });

  // Factory method untuk konversi dari Map
  factory Product.fromMap(Map<String, String> map) {
    return Product(
      imageUrl: map['imageUrl'] ?? '',
      name: map['name'] ?? '',
      price: double.parse(map['price'] ?? '0'),
      description: map['description'] ?? '',
      isLiked: false, // Tetapkan nilai default isLiked saat konversi
    );
  }

  // Metode untuk konversi ke Map (opsional, jika dibutuhkan)
  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'price': price.toString(),
      'description': description,
      'isLiked': isLiked,
    };
  }
}
