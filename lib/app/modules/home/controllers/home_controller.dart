import 'package:get/get.dart';
import 'package:study_group_flutter/service/product_service.dart';
import '../../../data/models/product_model_api.dart';

class HomeController extends GetxController {
  var selectedCategory = 'All'.obs; // Kategori yang dipilih
  var categories = <String>[].obs; // Daftar kategori dari API
  var product = Product().obs; // Data produk dari API
  var isLoading = true.obs; // Status loading buat UI
  var likes = <int, bool>{}.obs; // Map buat lacak status "liked" per produk
  var categoryScrollPosition = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories(); // Ambil daftar kategori
    fetchProducts(); // Ambil semua produk waktu inisialisasi
  }

  /// Ambil kategori dari API
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
        'All', // Fallback kalau API gagal
        'beauty',
        'fragrances',
        'furniture',
      ];
    } finally {
      isLoading.value = false;
    }
  }

  /// Ambil produk dari API berdasarkan kategori
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

      // Reset "likes" untuk produk yang baru diambil
      initializeLikes();
    } catch (e) {
      print("Error fetching products: $e");
      Get.snackbar('Error', 'Gagal mengambil produk');
    } finally {
      isLoading.value = false;
    }
  }

  /// Inisialisasi "likes" untuk produk yang baru diambil
  void initializeLikes() {
    likes.clear();
    if (product.value.products != null) {
      for (var i = 0; i < product.value.products!.length; i++) {
        likes[i] = false; // Default: Tidak disukai
      }
    }
  }

  /// Toggle status "liked" untuk produk tertentu
void toggleLike(int index) {
  likes[index] = !(likes[index] ?? false);
  print('Product $index like status: ${likes[index]}'); // Debugging
  likes.refresh(); // Refresh untuk memicu UI
}

void saveScrollPosition(double position) {
  categoryScrollPosition.value = position; //simpen posisi scroll
}

  /// Pencarian produk berdasarkan nama
  void searchProducts(String query) {
    if (query.isEmpty) {
      fetchProducts(category: selectedCategory.value); // Reset ke semua produk
      return;
    }

    // Filter produk berdasarkan judul yang sesuai dengan query
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
}
