import 'package:get/get.dart';
import 'package:plant_identify/core/constant/routes.dart';
import 'package:plant_identify/view/pages/homa_page.dart';

class AppRouter {
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: AppRoutes.index,
      page: () => const HomePage(),
    )
  ];
}
