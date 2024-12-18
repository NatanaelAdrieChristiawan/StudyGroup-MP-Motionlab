import 'package:flutter/material.dart';
import 'product_detail_screen.dart';
import 'login_screen.dart'; // Import LoginScreen for logout navigation
import '../models/product_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Image.asset(
                'assets/images/logo.png',
                height: 48,
                width: 48,
              ),
            ),
          ),
          const Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
            size: 30,
          ),
          const SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF00623B),
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  "Our way of loving\nyou back",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                filled: true,
                fillColor: const Color.fromARGB(255, 231, 229, 229),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryTab(text: "All", isActive: true),
                  CategoryTab(text: "Watch"),
                  CategoryTab(text: "Shirt"),
                  CategoryTab(text: "Shoes"),
                  CategoryTab(text: "Food"),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Our Best Seller",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 35),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: productList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            imageUrl: product.imageUrl,
                            name: product.name,
                            price: product.price.toStringAsFixed(2),
                            description: product.description,
                          ),
                        ),
                      );
                    },
                    child: ProductCard(
                      imageUrl: product.imageUrl,
                      name: product.name,
                      price: product.price,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF00623B),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white, size: 32),
              onPressed: () {
                // Navigasi ke Home jika dibutuhkan
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.white, size: 32),
              onPressed: () {
                // Aksi untuk halaman Favorite
              },
            ),
            IconButton(
              icon: const Icon(Icons.person_outline, color: Colors.white, size: 32),
              onPressed: () {
                // Aksi untuk halaman Profile
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String text;
  final bool isActive;

  const CategoryTab({
    super.key,
    required this.text,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFF00623B)
            : const Color.fromARGB(255, 233, 233, 233),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final double price;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLiked = false; // Status untuk ikon love

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 161, 161, 161),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  height: 155,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "\$${widget.price.toStringAsFixed(2)}",
                  style: const TextStyle(color: Color(0xFF00623B), fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        // Icon love di kanan bawah
        Positioned(
          right: 8,
          bottom: 8,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isLiked = !isLiked; // Toggle status icon love
              });
            },
            child: Icon(
              Icons.favorite,
              color: isLiked ? Colors.red : Colors.grey, // Warna berubah saat ditekan
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}


// Dummy Product List
final List<Product> productList = [
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
];
