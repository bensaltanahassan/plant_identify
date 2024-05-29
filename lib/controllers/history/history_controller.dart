import 'package:get/get.dart';
import 'package:plant_identify/core/constant/routes.dart';
import 'package:plant_identify/core/services/services.dart';
import 'package:plant_identify/data/datasource/cash/history_cash.dart';
import 'package:plant_identify/data/model/plant_model.dart';

class HistoryController extends GetxController {
  late HistoryCash historyCash;
  List<PlantModelInformation> history = [];
  Future<void> getHistory() async {
    history = await historyCash.getHistory();
    update();
  }

  Future<void> deleteHistory({required PlantModelInformation p}) async {
    historyCash.deleteHistory(id: p.id.toString()).then(
      (value) async {
        await getHistory();
      },
    );
  }

  Future<void> addToHistory(
      {required PlantModelInformation plantModelInformation}) async {
    try {
      await historyCash
          .addToHistory(
        plantModelInformation: plantModelInformation,
      )
          .then((value) async {
        await getHistory();
      });
    } catch (e) {
      print("===========Error Add History==========");
      print(e);
    }
  }

  void goToPlanrDetails({required PlantModelInformation p}) async {
    Get.toNamed(AppRoutes.plantDetails, arguments: {
      "plant": p,
    });
  }

  @override
  void onInit() {
    historyCash = HistoryCash(Get.find<MyServices>().boxHistory);
    super.onInit();
  }
}
