import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:study_group_flutter/app/common/widgets/custom_button.dart';
import 'package:study_group_flutter/app/routes/app_pages.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({super.key});
  @override
  Widget build(BuildContext context) {

   

    // Get.lazyPut(() => CartController());
    // Get.put(CartController());

    return GetBuilder<DetailProductController>(
        init: DetailProductController(),
        builder: (_) {
          return Obx(() =>  Scaffold(
            appBar: AppBar(
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              title: const Text('Product'),
              centerTitle: true,
              actions: const [
                // IconButton(
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.favorite,
                //     color: product.isFavorite ? Colors.red : Colors.grey,
                //   ),
                // )
              ],
            ),
            body: controller.isLoading.value ? const Material(child: Center(child: CircularProgressIndicator())) :  SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                     controller.detailProduct.value.thumbnail ?? "",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    controller.detailProduct.value.title ?? "",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '\$${ controller.detailProduct.value.price?.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: const Color.fromARGB(255, 0, 154, 92),
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                     controller.detailProduct.value.description ?? "",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16),
              child: CustomButton(
                text: 'Add to Cart',
                onTap: () {
                  // final cartController = Get.find<CartController>();
                  // cartController.incrementQuantity(controller.detailProduct.value.id ?? 0) ;
                  Get.toNamed(Routes.CART);
                },
              ),
            ),
          ));
        });
  }
}
