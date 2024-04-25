import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_identify/bindings/initialebinding.dart';
import 'package:plant_identify/core/services/services.dart';
import 'package:plant_identify/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final LocaleController localeController = Get.put(LocaleController());
    // print the dimension of the screen

    return ScreenUtilInit(
      designSize: const Size(411, 867),
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Restaurant Mobile',
          // theme: localeController.appTheme,
          getPages: AppRouter.routes,
          initialBinding: InitialeBindings(),
          // locale: localeController.language,
        );
      },
    );
  }
}
