import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_identify/controllers/history/history_controller.dart';
import 'package:plant_identify/core/constant/routes.dart';
import 'package:plant_identify/core/functions/showsnackbar.dart';

class CameraScanController extends GetxController {
  late CameraController controller;
  late List<CameraDescription> _cameras;
  bool isCameraReady = false;
  bool isError = false;
  XFile? image;
  bool? capturing = false;

  late HistoryController historyController;

  void goToPlanrDetails() async {
    try {
      Get.toNamed(AppRoutes.plantDetails, arguments: {"image": image});
    } catch (e) {
      showCustomSnackBar(
        title: "Error",
        message: "An error occurred while saving image",
      );
    }
  }

  Future<void> pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image = XFile(pickedFile.path);
        update();
      } else {
        showCustomSnackBar(title: "Error", message: "No image selected");
      }
    } catch (_) {
      showCustomSnackBar(
        title: "Error",
        message: "An error occurred while selecting image",
      );
    }
  }

  Future<void> takePicture() async {
    try {
      capturing = true;
      update(["capture"]);
      image = await controller.takePicture();
      capturing = false;
      update();
      update(["capture"]);
    } catch (e) {}
  }

  Future<void> allumeFlash() async {
    await controller.setFlashMode(FlashMode.torch);
    update(["flash"]);
  }

  Future<void> eteindreFlash() async {
    await controller.setFlashMode(FlashMode.off);
    update(["flash"]);
  }

  Future<void> swapCamera() async {
    final lensDirection = controller.description.lensDirection;
    CameraDescription newDescription;
    if (lensDirection == CameraLensDirection.front) {
      newDescription = _cameras.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.back);
    } else {
      newDescription = _cameras.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.front);
    }
    controller = CameraController(newDescription, ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!controller.value.isInitialized) {
        isError = true;
        update();
        return;
      }
      isCameraReady = true;
      update();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) async {
      if (!controller.value.isInitialized) {
        isError = true;
        update();
        return;
      }
      await controller.setFlashMode(FlashMode.off);

      isCameraReady = true;
      update();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void onInit() async {
    super.onInit();
    if (Get.isRegistered<HistoryController>()) {
      historyController = Get.find<HistoryController>();
    } else {
      historyController = Get.put(HistoryController());
    }
    await initCamera();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
