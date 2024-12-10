import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Ubah initialRoute ke '/login'
      routes: {
        '/': (context) =>  const HomeScreen(), 
        '/login': (context) => const LoginScreen(), 
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
