import 'package:flutter/material.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
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

          // Search Bar
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

          // Horizontal Scrollable Category Tabs
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

          // Product List Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Our Best Seller",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 35),

          // Scrollable Product Section
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
                itemCount: 4, // Jumlah produk
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Disable scroll on GridView
                itemBuilder: (context, index) {
                  return ProductCard(
                    imageUrl: productData[index]['imageUrl']!,
                    name: productData[index]['name']!,
                    price: productData[index]['price']!,
                  );
                },
              ),
            ),
          ),
        ],
      ),

      // Bottom App Bar
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xFF00623B), // Background color of bottom app bar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.white, size: 32),
              onPressed: null, // Add your onPressed functionality here
            ),
            IconButton(
              icon: Icon(Icons.account_balance_wallet_outlined,
                  color: Colors.white, size: 32),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.white, size: 32),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.white, size: 32),
              onPressed: null,
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
    Key? key,
    required this.text,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFF00623B)
            : const Color.fromARGB(255, 233, 233, 233),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16, // Ukuran teks diperbesar
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
  final String price;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLiked = false; // Status untuk ikon love

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 161, 161, 161),
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Stack(
        children: [
          Column(
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
                  "\$${widget.price}",
                  style: const TextStyle(color: Color(0xFF00623B), fontSize: 16),
                ),
              ),
            ],
          ),
          // Icon love
          Positioned(
            right: 8,
            bottom: 2,
            child: IconButton(
              icon: Icon(
                Icons.favorite,
                color: isLiked ? Colors.red : Colors.grey,
                size: 22,
              ),
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy product data
final List<Map<String, String>> productData = [
  {
    "imageUrl": "assets/images/smartwatch.png",
    "name": "Mi Band 8 Pro",
    "price": "54.00"
  },
  {
    "imageUrl": "assets/images/baju2.png",
    "name": "Lycra Men's Shirt",
    "price": "12.00"
  },
  {
    "imageUrl": "assets/images/headphone1.png",
    "name": "Gaming Headset",
    "price": "29.00"
  },
  {
    "imageUrl": "assets/images/sepatu2.png",
    "name": "Running Shoes",
    "price": "45.00"
  },
];