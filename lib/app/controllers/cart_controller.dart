import 'package:get/get.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <Product, int>{}.obs;

  void addProduct(Product product) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + 1;
    } else {
      cartItems[product] = 1;
    }
    update();
  }

  void removeProduct(Product product) {
    if (cartItems.containsKey(product) && cartItems[product]! > 1) {
      cartItems[product] = cartItems[product]! - 1;
    } else {
      cartItems.remove(product);
    }
    update();
  }
}
