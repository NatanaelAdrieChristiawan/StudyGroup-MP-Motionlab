import '../models/product_model_api.dart';
import '../../shared/constanta.dart';
import 'package:dio/dio.dart';
import '../models/user_model.dart';

class ProductService {

  final Dio dio = Dio();
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
      final response = await dio
          .get('$url/products/category-list'); // Ganti ke category-list
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
        if (response.data['products'] == null ||
            response.data['products'].isEmpty) {
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

  Future<UserModel> loginService({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '$url/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200 && response.data != null) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception('Login failed. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data['message']);
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }
}
