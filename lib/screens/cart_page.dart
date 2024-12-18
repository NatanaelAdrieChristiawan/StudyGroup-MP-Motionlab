import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'product_cart_tile.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Obx(
        () {
          if (cartController.cartItems.isEmpty) {
            return const Center(
              child: Text(
                "Your cart is empty!",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            );
          }

          // List of cart items
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              final product = cartController.cartItems.keys.elementAt(index);
              final quantity = cartController.cartItems[product]!;

              return ProductCartTile(
                product: product, // Product model object
                quantity: quantity,
                onAdd: () => cartController.addProduct(product),
                onRemove: () => cartController.removeProduct(product),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Obx(() {
        // Hitung total harga dari semua item di keranjang
        final totalPrice = cartController.cartItems.entries.fold(
          0.0,
          (sum, entry) => sum + (entry.key.price * entry.value),
        );

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Display Total Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$${totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00623B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Button Buy Now
              ElevatedButton(
                onPressed: () {
                  final totalPrice = cartController.cartItems.entries.fold(
                    0.0,
                    (sum, entry) => sum + (entry.key.price * entry.value),
                  );
                  // Navigasi ke halaman pembayaran dan kirim total harga
                  Get.toNamed('/payment', arguments: totalPrice);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00623B),
                  padding: const EdgeInsets.all(16),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Buy Now",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}