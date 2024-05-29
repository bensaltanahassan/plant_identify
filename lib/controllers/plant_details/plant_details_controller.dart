import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plant_identify/controllers/camera/camera_scan_controller.dart';
import 'package:plant_identify/controllers/history/history_controller.dart';
import 'package:plant_identify/core/class/crud.dart';
import 'package:plant_identify/core/class/statusrequest.dart';
import 'package:plant_identify/core/functions/handlingdatacontroller.dart';
import 'package:plant_identify/data/datasource/remote/prediction_data.dart';
import 'package:plant_identify/data/model/plant_model.dart';

class PlantDetailController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  late XFile? image;
  FlutterTts flutterTts = FlutterTts();
  double progressAbout = 0.0;
  double progressNutrition = 0.0;
  bool isSpeakingAbout = false;
  bool isSpeakingNutrition = false;
  PlantModelInformation? plantModeInformation;
  PredictionData pd = PredictionData(Get.find<Crud>());

  Future<void> predectPlant() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pd.sendImage(
      image: File(image!.path),
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      plantModeInformation = PlantModelInformation.fromJson(response);
      if (plantModeInformation!.status == false) {
        statusRequest = StatusRequest.failure;
      } else {
        update();

        // save the image to the device and navigate to the plant details page
        final String path = await getApplicationDocumentsDirectory().then(
          (value) => value.path,
        );
        final String imagePath = "$path/${DateTime.now()}.png";
        await image!.saveTo(imagePath);

        plantModeInformation!.id = DateTime.now().toString();
        plantModeInformation!.localImagePath = imagePath;
        plantModeInformation!.date = DateTime.now().toString();

        await Get.find<HistoryController>()
            .addToHistory(plantModelInformation: plantModeInformation!);
      }
      Get.find<CameraScanController>().image = null;
      Get.find<CameraScanController>().update();
    }
    update();
  }

  void turnoffSpeackers() {
    progressAbout = 0;
    progressNutrition = 0;
    isSpeakingNutrition = false;
    isSpeakingAbout = false;
  }

  void turnOnSpeacker({required String widgetId}) {
    switch (widgetId) {
      case "speak_about":
        isSpeakingAbout = true;
        break;
      case "speak_nutrition":
        isSpeakingNutrition = true;
        break;
      default:
    }
  }

  Future speak({
    required String text,
    required String widgetId,
  }) async {
    turnoffSpeackers();
    turnOnSpeacker(widgetId: widgetId);
    update();
    double progress = 0.0;

    flutterTts.setProgressHandler(
        (String text, int startOffset, int endOffset, String word) {
      progress = endOffset.toDouble() / (text.length.toDouble() - 1);
      print("=========Progress Handler==========");
      print("progress: $progress");
      switch (widgetId) {
        case "speak_about":
          progressAbout = progress;
          break;
        case "speak_nutrition":
          progressNutrition = progress;
          break;
        default:
      }
      update();
    });

    flutterTts.setCompletionHandler(() {
      turnoffSpeackers();
      update();
    });

    await flutterTts.speak(text);
  }

  Future stop() async {
    var result = await flutterTts.stop();
    if (result == 1) {}
  }

  @override
  void onInit() async {
    super.onInit();

    if (Get.arguments["plant"] != null) {
      plantModeInformation = Get.arguments["plant"] as PlantModelInformation;
      image = XFile(plantModeInformation!.localImagePath!);
      statusRequest = StatusRequest.success;
      update();
    } else {
      image = Get.arguments["image"] as XFile;
      predectPlant();
    }
    await Future.wait([
      flutterTts.setLanguage("en-US"),
      flutterTts.setSpeechRate(0.4),
      flutterTts.setVolume(1.0),
      flutterTts.setPitch(1.0),
    ]);
  }
}
