import 'package:get/get.dart';
import '../../../../app/data/service/remote_datasource_service.dart';
import 'package:study_group_flutter/app/modules/favorite/controllers/favorite_controller.dart';
import '../../../data/models/product_model_api.dart';

class HomeController extends GetxController {
  var selectedCategory = 'All'.obs;
  var categories = <String>[].obs;
  var product = Product().obs;
  var isLoading = true.obs;
  var categoryScrollPosition = 0.0.obs;

  // Ubah menjadi nullable
  FavoriteController? favoriteController;

  @override
  void onInit() {
    super.onInit();

    // Cek apakah FavoriteController sudah di-register
    if (Get.isRegistered<FavoriteController>()) {
      favoriteController = Get.find<FavoriteController>();
    } else {
      print("Error: FavoriteController is not registered.");
    }

    fetchCategories();
    fetchProducts();
  }

  void fetchCategories() async {
    try {
      isLoading.value = true;
      final fetchedCategories = await ProductService().getProductCategories();
      if (fetchedCategories != null && fetchedCategories.isNotEmpty) {
        categories.value = fetchedCategories;
      } else {
        throw Exception("Empty categories from API");
      }
      categories.insert(0, 'All');
    } catch (e) {
      print("Error fetching categories: $e");
      categories.value = [
        'All',
        'beauty',
        'fragrances',
        'furniture',
      ];
    } finally {
      isLoading.value = false;
    }
  }

  void fetchProducts({String? category}) async {
    try {
      isLoading.value = true;
      if (category == null || category == 'All') {
        product.value = await ProductService().getProducts() ?? Product();
      } else {
        product.value = await ProductService()
                .getProductsByCategory(category: category) ??
            Product();
      }
      selectedCategory.value = category ?? 'All';
    } catch (e) {
      print("Error fetching products: $e");
      Get.snackbar('Error', 'Gagal mengambil produk');
    } finally {
      isLoading.value = false;
    }
  }

  void saveScrollPosition(double position) {
    categoryScrollPosition.value = position;
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      fetchProducts(category: selectedCategory.value);
      return;
    }

    final filteredProducts = product.value.products
        ?.where((item) =>
            item.title?.toLowerCase().contains(query.toLowerCase()) ?? false)
        .toList();

    product.value = Product(
      products: filteredProducts,
      total: filteredProducts?.length ?? 0,
      skip: 0,
      limit: filteredProducts?.length ?? 0,
    );
  }

  bool isFavorite(int? productId) {
    // Tambahkan fallback jika favoriteController null
    return productId != null &&
        (favoriteController?.favoriteProducts.contains(productId) ?? false);
  }

  void toggleFavorite(int productId) {
    // Gunakan Get.find langsung jika favoriteController null
    if (favoriteController != null) {
      favoriteController!.toggleFavorite(productId);
    } else {
      Get.find<FavoriteController>().toggleFavorite(productId);
    }
  }
}