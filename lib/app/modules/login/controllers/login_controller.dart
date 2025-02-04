import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_group_flutter/app/data/models/user_model.dart';
import '../../../data/service/remote_datasource_service.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ProductService remoteDatasourceService = ProductService();

  // Ubah isLoading menjadi RxBool agar dapat digunakan dengan Obx
  var isLoading = false.obs;

  String errorMessage = '';

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateInput() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    if (username.isEmpty) {
      return 'Username cannot be empty';
    } else if (username.length < 3) {
      return 'Username must be at least 3 characters long';
    }
    if (password.isEmpty) {
      return 'Password cannot be empty';
    } else if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  Future<void> login() async {
    final validationError = validateInput();
    if (validationError != null) {
      Get.snackbar('Validation Error', validationError);
      return;
    }

    isLoading.value = true; // Mulai loading
    try {
      final UserModel user = await remoteDatasourceService.loginService(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Simpan data login ke SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_logged_in', true);
      await prefs.setString('username', usernameController.text.trim());
      await prefs.setString('password', passwordController.text.trim());

      print('Username saved: ${prefs.getString('username')}');
      print('Password saved: ${prefs.getString('password')}');

      Get.snackbar('Login Successful', 'Welcome, ${user.firstName}');
      Get.offAllNamed('/dashboard'); // Navigasi ke halaman dashboard
    } catch (e) {
      print('Login Error: $e');
      Get.snackbar('Login Failed', e.toString());
    } finally {
      isLoading.value = false; // Hentikan loading
    }
  }
}