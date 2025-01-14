import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil data produk dari arguments atau tampilkan fallback jika null
    final Product? product = Get.arguments;

    if (product == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Product Not Found'),
        ),
        body: const Center(
          child: Text('No product data available!'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: product.imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        product.imageUrl,
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF00623B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: ElevatedButton(
              onPressed: () {
                cartController.addProduct(product);
                Get.toNamed('/cart');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00623B),
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Add to Cart",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
