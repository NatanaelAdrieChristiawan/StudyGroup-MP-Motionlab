import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteController extends GetxController {
  var favoriteProducts = <int>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getFavorites();
  }

  Future<void> toggleFavorite(int productId) async {
    if (favoriteProducts.contains(productId)) {
      favoriteProducts.remove(productId);
    } else {
      favoriteProducts.add(productId);
    }
    await saveFavorites();
    update();
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('favorites', jsonEncode(favoriteProducts));
  }

  Future<void> getFavorites() async {
    try {
      isLoading(true);
      final prefs = await SharedPreferences.getInstance();
      final favoritesString = prefs.getString('favorites');
      if (favoritesString != null) {
        favoriteProducts.value = List<int>.from(jsonDecode(favoritesString));
      }
    } finally {
      isLoading(false);
    }
  }

  bool isFavorite(int? productId) {
    return productId != null && favoriteProducts.contains(productId);
  }
}