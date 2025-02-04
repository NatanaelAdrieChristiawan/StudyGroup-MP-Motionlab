import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/service/remote_datasource_service.dart';
import '../../../data/models/user_model.dart';

class ProfileController extends GetxController {
  var isLoading = true.obs;
  var userData = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      isLoading(true);
      final prefs = await SharedPreferences.getInstance();
      final username = prefs.getString('username') ?? '';
      final password = prefs.getString('password') ?? '';

      print('Username from SharedPreferences: $username');
      print('Password from SharedPreferences: $password');

      if (username.isNotEmpty && password.isNotEmpty) {
        final service = ProductService();
        final user = await service.loginService(username: username, password: password);

        // Pastikan data pengguna tidak null
        if (user != null) {
          userData.value = user;
          print('User data fetched successfully: ${user.toJson()}');
        } else {
          Get.snackbar('Error', 'Failed to fetch user data');
        }
      } else {
        Get.snackbar('Error', 'Username or password is missing');
      }
    } catch (e) {
      print('Error fetching user data: $e');
      Get.snackbar('Error', 'Failed to load user data: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_logged_in', false);
      await prefs.remove('username');
      await prefs.remove('password');
      Get.snackbar('Logged Out', 'You have been logged out');
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar('Error', 'Failed to log out: $e');
    }
  }
}