import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_identify/controllers/home/home_controller.dart';
import 'package:plant_identify/view/pages/camera_page.dart';
import 'package:plant_identify/view/pages/history_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<HomeController>(
          id: 'bottom_nav',
          builder: (controller) {
            return BottomNavigationBar(
              onTap: controller.changeIndex,
              currentIndex: controller.currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.camera_alt_outlined),
                  label: 'Camera',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history_outlined),
                  label: 'History',
                ),
              ],
            );
          }),
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          onPageChanged: controller.changeIndex,
          children: const [CameraPage(), HistoryPage()],
        ),
      ),
    );
  }
}
