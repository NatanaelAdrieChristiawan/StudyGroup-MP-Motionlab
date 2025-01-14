import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Gambar logo atau gambar login
                Image.asset(
                  'assets/images/login.png', // Ganti dengan path gambar Anda
                  height: 250.0,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),

                // Teks "Welcome!"
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Teks "Happy Shopping All"
                const Text(
                  'Happy Shopping All',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 40),

                // Username Input
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20),

                // Password Input
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 20),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    // Navigasi menggunakan Get.toNamed
                    Get.toNamed('/'); // Rute awal (HomeScreen)
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: const Color(0xFF00623B),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Link to Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        // Navigasi menggunakan Get.toNamed
                        Get.toNamed('/register'); // Rute ke RegisterScreen
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 12, color: Color(0xFF00623B)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
