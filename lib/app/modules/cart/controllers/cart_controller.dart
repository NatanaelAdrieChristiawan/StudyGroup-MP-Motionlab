import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_group_flutter/app/data/models/product_model.dart';
import 'package:study_group_flutter/app/utils/data_dummy.dart';

class CartController extends GetxController {
  RxDouble totalProduct = 0.0.obs;
  RxMap<String, int> quantities = <String, int>{}.obs;

  void incrementQuantity(String productId) {
    if (quantities.containsKey(productId)) {
      quantities[productId] = quantities[productId]! + 1;
    } else {
      quantities[productId] = 1;
    }
    update();
  }

  void decrementQuantity(String productId) {
    if (quantities.containsKey(productId)) {
      if (quantities[productId]! <= 1) {
        Get.defaultDialog(
          title: 'Remove Item',
          middleText: 'Do you want to remove this item from cart?',
          textConfirm: 'Yes',
          textCancel: 'No',
          confirmTextColor: Colors.white,
          onConfirm: () {
            quantities.remove(productId);
            update();
            Get.back();
          },
          buttonColor: const Color(0xFF00623B),
          contentPadding: const EdgeInsets.all(20),
          titlePadding: const EdgeInsets.only(top: 20),
        );
      } else {
        quantities[productId] = quantities[productId]! - 1;
        update();
      }
    }
  }

  int getQuantity(String productId) {
    return quantities[productId] ?? 0;
  }

  double calculateTotal() {
    double total = 0.0;
    quantities.forEach((productId, quantity) {
      ProductModel product = DataDummy.listDummyProducts.firstWhere(
        (product) => product.id == productId,
      );
      total += product.price * quantity;
    });
    return total;
  }
}
