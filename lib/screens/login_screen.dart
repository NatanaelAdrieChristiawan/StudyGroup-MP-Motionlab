import 'package:flutter/material.dart';
import 'package:shopping_ui/screens/home_screen.dart';
import 'package:shopping_ui/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Menghapus debug
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Gambar logo atau gambar login
              Image.asset(
                'assets/images/login.png', // Ganti dengan path gambar Anda
                height: 250.0, // Sesuaikan tinggi gambar
                fit: BoxFit.contain, // Pastikan gambar tetap terjaga ukuran dan proporsinya
              ),
              const SizedBox(height: 20),

              // Teks "Welcome!" dengan ukuran font 22
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Teks "Happy Shopping All" dengan ukuran font 18
              const Text(
                'Happy Shopping All',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40), // Jarak sebelum form input

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
                  // Navigasi ke halaman utama setelah login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: const Color(0xFF00623B), // Warna tombol
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white, // Warna teks putih untuk kontras
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8), // Perkecil jarak di sini

              // Link to Forgot Password and Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Rapatkan jarak
                children: [
                  const TextButton(
                    onPressed: null,
                    child: Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 12), // Ukuran font lebih kecil
                    ),
                  ),
                  const SizedBox(width: 10), // Menambahkan jarak kecil
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 12, color: Color(0xFF00623B) ), // Ukuran font lebih kecil
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
