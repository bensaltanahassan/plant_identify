import 'package:get/get.dart';
import 'package:plant_identify/core/class/crud.dart';

class InitialeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
