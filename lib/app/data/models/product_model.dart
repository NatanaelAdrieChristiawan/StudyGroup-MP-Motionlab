class ProductModel {
  String id;
  String image;
  String name;
  double price;
  String description;
  String type;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.type,
    required this.isFavorite,
  });
}
