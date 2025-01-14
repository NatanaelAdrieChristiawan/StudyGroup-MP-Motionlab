import 'package:get/get.dart';
import '../views/home_screen.dart';
import '../views/login_screen.dart';
import '../views/register_screen.dart';
import '../views/cart_page.dart';
import '../views/payment_page.dart';
import '../views/product_detail_screen.dart'; // Tambahkan impor ini

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String cart = '/cart';
  static const String payment = '/payment';
  static const String productDetail = '/product-detail'; // Tambahkan konstanta ini

  static final routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: register, page: () => const RegisterScreen()),
    GetPage(name: cart, page: () => CartPage()),
    GetPage(name: payment, page: () => const PaymentPage()),
    GetPage(
      name: productDetail, // Tambahkan rute untuk product-detail
      page: () => ProductDetailScreen(),
    ),
  ];
}
