import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductCartTile extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductCartTile({
    super.key,
    required this.product,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          // Gambar produk
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              product.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),

          // Nama produk dan harga
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          // Tombol tambah/kurang
          Row(
            children: [
              IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.remove_circle_outline, color: Colors.green),
              ),
              Text(
                "$quantity",
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                onPressed: onAdd,
                icon: const Icon(Icons.add_circle_outline, color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
