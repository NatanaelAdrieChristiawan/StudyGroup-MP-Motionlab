import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  key: scaffoldKey,
                  backgroundColor: Colors.white,
                  appBar: _buildAppBar(scaffoldKey),
                  drawer: _buildDrawer(),
                  body: SafeArea(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          _buildTitle(context),
                          const SizedBox(height: 20),
                          _buildSearchBar(),
                          const SizedBox(height: 20),
                          _buildCategoryList(),
                          const SizedBox(height: 20),
                          _buildProductList(),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }

  AppBar _buildAppBar(GlobalKey<ScaffoldState> scaffoldKey) {
    return AppBar(
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
        height: kToolbarHeight - 16.h,
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
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
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
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Our way of loving \nyou back',
      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 25.sp),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onChanged: (value) {
        controller.searchProducts(value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xFF868A91),
        ),
        hintText: 'Search',
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: const Color(0xFFF2F2F2),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 40.h,
      child: Obx(() {
        return ListView.separated(
          controller: ScrollController(
            initialScrollOffset: controller.categoryScrollPosition.value,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final category = controller.categories[index];
            final isSelected = controller.selectedCategory.value == category;

            return GestureDetector(
              onTap: () {
                controller.saveScrollPosition(index * 120.0);
                controller.fetchProducts(category: category);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF00623B)
                      : const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : const Color(0xFF4D4D4D),
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildProductList() {
  return GridView.builder(
  shrinkWrap: true,
  primary: false,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    childAspectRatio: 0.75,
  ),
  itemCount: controller.product.value.products?.length ?? 0,
  itemBuilder: (context, index) {
    final data = controller.product.value.products?[index];

    return Obx(() {
      return ProductCard(
        product: data,
        isLiked: controller.isFavorite(data?.id), // Gunakan isFavorite dari FavoriteController
        onLikePressed: () {
          if (data?.id != null) {
            controller.toggleFavorite(data!.id!);
          }
        },
        onTap: () {
          Get.toNamed(
            '/detail-product',
            arguments: {"id": data?.id ?? 0},
          );
        },
      );
    });
  },
);
  }
}

class ProductCard extends StatelessWidget {
  final dynamic product;
  final bool isLiked;
  final VoidCallback onLikePressed;
  final VoidCallback onTap;

  const ProductCard({
    required this.product,
    required this.isLiked,
    required this.onLikePressed,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    product?.thumbnail ?? "",
                    fit: BoxFit.cover,
                    height: 120.h,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product?.title ?? "No Title",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${(product?.price ?? 0).toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Color(0xFF00623B),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 8,
          bottom: 8,
          child: IconButton(
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : Colors.grey,
            ),
            onPressed: onLikePressed,
          ),
        ),
      ],
    );
  }
}