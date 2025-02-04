import 'package:get/get.dart';
import '../../favorite/bindings/favorite_binding.dart';
import '../../home/bindings/home_binding.dart';
import '../../profile/bindings/profile_binding.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // Daftarkan DashboardController
    Get.lazyPut<DashboardController>(() => DashboardController());

    // Daftarkan binding untuk halaman anak
    HomeBinding().dependencies();
    FavoriteBinding().dependencies();
    ProfileBinding().dependencies();
  }
}