import 'package:get/get.dart';
import '../../favorite/controllers/favorite_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Daftarkan FavoriteController terlebih dahulu
    Get.put<FavoriteController>(FavoriteController(), permanent: true);

    // Kemudian daftarkan HomeController
    Get.lazyPut<HomeController>(() => HomeController());
  }
}