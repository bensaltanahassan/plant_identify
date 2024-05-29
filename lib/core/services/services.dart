// import 'package:firebase_core/firebase_core.dart';
// import 'package:plant_identify/firebase_options.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyServices extends GetxService {
  late Box boxHistory;
  Future<MyServices> init() async {
    await Hive.initFlutter();
    boxHistory = await Hive.openBox('history');
    // await boxHistory.clear();

    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    // sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialService() async {
  await Get.putAsync(() => MyServices().init());
}
