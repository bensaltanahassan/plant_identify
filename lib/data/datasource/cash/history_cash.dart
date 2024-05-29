import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:plant_identify/data/model/plant_model.dart';

class HistoryCash {
  late Box boxHistory;

  HistoryCash(this.boxHistory);

  Future<List<PlantModelInformation>> getHistory() async {
    List<PlantModelInformation> history = [];
    try {
      final result = boxHistory.values;
      final jsons = result
          .map((e) => jsonDecode(jsonEncode(e)))
          .toList()
          .reversed
          .toList();
      history = jsons.map((e) => PlantModelInformation.fromJson(e)).toList();
      for (var item in history) {
        print("===========Get History ${item.id}==========");
        print(item.localImagePath);
      }
    } catch (e) {
      print("===========Error Get History==========");
      print(e);
    }

    return history;
  }

  Future<void> deleteHistory({required String id}) async {
    try {
      await boxHistory.delete(id);
      print("===========Delete History $id==========");
    } catch (e) {
      print("===========Error Delete History==========");
      print(e);
    }
  }

  Future<void> clearHistory() async {
    await boxHistory.clear();
  }

  Future<void> addToHistory(
      {required PlantModelInformation plantModelInformation}) async {
    try {
      await boxHistory.put(
          plantModelInformation.id.toString(), plantModelInformation.toJson());
    } catch (e) {
      print("===========Error Add History==========");
      print(e);
    }
  }
}
