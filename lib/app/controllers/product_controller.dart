import 'package:get/get.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  var products = <Product>[
    Product(
      imageUrl: "assets/images/smartwatch.png",
      name: "Mi Band 8 Pro",
      price: 54.00,
      description: "A smart fitness tracker with advanced health tracking features.",
    ),
    Product(
      imageUrl: "assets/images/baju2.png",
      name: "Lycra Men's Shirt",
      price: 12.00,
      description: "Breathable and flexible fabric perfect for daily wear.",
    ),
    Product(
      imageUrl: "assets/images/headphone1.png",
      name: "Gaming Headset",
      price: 29.00,
      description: "High-quality gaming headset with noise cancellation.",
    ),
    Product(
      imageUrl: "assets/images/sepatu2.png",
      name: "Running Shoes",
      price: 45.00,
      description: "Durable running shoes, perfect for workouts.",
    ),
  ].obs;

  void toggleLike(int index) {
    products[index].isLiked = !products[index].isLiked;
    products.refresh(); // Memastikan UI diperbarui
  }
}
