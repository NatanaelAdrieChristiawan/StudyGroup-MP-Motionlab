import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:study_group_flutter/app/modules/home/controllers/home_controller.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    // Pastikan FavoriteController tersedia
    if (!Get.isRegistered<FavoriteController>()) {
      return const Scaffold(
        body: Center(child: Text('Error: FavoriteController is not registered')),
      );
    }

    final controller = Get.find<FavoriteController>();
    final homeController = Get.isRegistered<HomeController>()
        ? Get.find<HomeController>()
        : null;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/icons/ic_logo.png',
          height: kToolbarHeight - 16,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
            onPressed: () {
              Get.toNamed('/cart');
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF00623B),
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                child: Image.asset(
                  'assets/icons/ic_logo.png',
                  height: 100,
                  width: 100,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                Get.offAllNamed('/login');
              },
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Gunakan HomeController jika tersedia
        if (homeController == null || homeController.product.value.products == null) {
          return const Center(child: Text('No product data available'));
        }

        final favoriteProducts = homeController.product.value.products!
            .where((p) => controller.favoriteProducts.contains(p.id))
            .toList();

        if (favoriteProducts.isEmpty) {
          return const Center(child: Text('No favorite products'));
        }

        return RefreshIndicator(
          onRefresh: controller.getFavorites,
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            primary: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.67,
            ),
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              final data = favoriteProducts[index];
              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Get.toNamed(
                    '/detail-product',
                    arguments: {"id": data.id},
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFFCFFFE),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: data.thumbnail ?? "https://example.com/placeholder.png",
                          fit: BoxFit.contain,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(
                            color: Color(0xFF00623B),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title ?? "",
                              style: const TextStyle(color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${data.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        color: const Color(0xFF00623B),
                                      ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.toggleFavorite(data.id!);
                                  },
                                  icon: Icon(
                                    controller.isFavorite(data.id)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: controller.isFavorite(data.id)
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}