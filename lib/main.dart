import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
