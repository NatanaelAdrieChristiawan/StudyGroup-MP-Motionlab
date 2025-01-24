import '../app/data/models/product_model_api.dart';
import '../app/shared/constanta.dart';

class ProductService {
  Future<Product?> getProducts() async {
    try {
      final response = await dio.get('$url/products');
      print(response.data);
      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<ProductElement?> getDetailsProducts({required int id}) async {
    try {
      final response = await dio.get('$url/products/$id');
      print(response.data);
      if (response.statusCode == 200) {
        return ProductElement.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<String>?> getProductCategories() async {
    try {
      final response = await dio.get('$url/products/category-list'); // Ganti ke category-list
      print("Response status: ${response.statusCode}");
      print("Response data: ${response.data}");
      if (response.statusCode == 200) {
        return List<String>.from(response.data);
      }
      return null;
    } catch (e) {
      print("Error in getProductCategories: $e");
      throw Exception(e);
    }
  }

  Future<Product?> getProductsByCategory({required String category}) async {
    try {
      final response = await dio.get('$url/products/category/$category');
      print("Response data for $category: ${response.data}");

      if (response.statusCode == 200 && response.data != null) {
        if (response.data['products'] == null || response.data['products'].isEmpty) {
          throw Exception("No products found for category $category");
        }
        return Product.fromJson(response.data);
      }
      throw Exception("Invalid response from API");
    } catch (e) {
      print("Error in getProductsByCategory: $e");
      throw Exception("Error fetching products for category $category: $e");
    }
  }
}
