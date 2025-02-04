import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_group_flutter/app/common/widgets/custom_button.dart';
import 'package:study_group_flutter/app/routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Pastikan ProfileController tersedia
    if (!Get.isRegistered<ProfileController>()) {
      return const Scaffold(
        body: Center(child: Text('Error: ProfileController is not registered')),
      );
    }

    final controller = Get.find<ProfileController>();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
              Get.toNamed(Routes.CART);
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
                controller.logout();
              },
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF00623B),
            ),
          );
        } else if (controller.userData.value == null) {
          return const Center(
            child: Text('No user data available'),
          );
        } else {
          final user = controller.userData.value!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text('Username: ${user.username}'),
                Text('Email: ${user.email}'),
                Text('Name: ${user.firstName} ${user.lastName}'),
                const Spacer(),
                CustomButton(
                  text: 'Logout',
                  onTap: () {
                    controller.logout();
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        }
      }),
    );
  }
}