import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  final pageController = PageController();

  void changeIndex(int index) async {
    currentIndex = index;
    pageController.jumpToPage(index);
    update(['bottom_nav']);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
