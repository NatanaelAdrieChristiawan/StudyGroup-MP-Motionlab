import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_group_flutter/app/modules/home/views/home_view.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeView(),
    const Center(
      child: Text('Belom Jadi Rekkk'),
    ),
    const Center(
      child: Text('OTW Yakk sing sabar'),
    ),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
