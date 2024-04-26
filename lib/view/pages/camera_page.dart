import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_identify/controllers/camera/camera_scan_controller.dart';

late List<CameraDescription> _cameras;

/// CameraApp is the Main Application.
class CameraPage extends StatelessWidget {
  /// Default Constructor
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CameraScanController());
    return GetBuilder<CameraScanController>(builder: (controller) {
      if (controller.isError) {
        return const Center(
          child: Text('Error: Camera not found'),
        );
      }
      if (!controller.isCameraReady) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            height: Get.height,
            child: controller.image != null
                ? Stack(
                    children: [
                      Image.file(
                        File(controller.image!.path),
                        fit: BoxFit.cover,
                        height: Get.height,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20).r,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.image = null;
                                controller.update();
                              },
                              child: CircleAvatar(
                                radius: 30,
                                child: Icon(
                                  Icons.close_outlined,
                                  weight: 30.h,
                                  size: 35.h,
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            GestureDetector(
                              onTap: controller.goToPlanrDetails,
                              child: Container(
                                padding: const EdgeInsets.all(5).r,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(4)),
                                child: const Icon(
                                  Icons.send_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : CameraPreview(controller.controller,
                    child: SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10, top: 10).r,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.swapCamera();
                                    },
                                    child: CircleAvatar(
                                      radius: 30.r,
                                      child: const Icon(
                                          Icons.flip_camera_ios_outlined),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  GestureDetector(
                                    onTap: () {
                                      controller.controller.value.flashMode ==
                                              FlashMode.off
                                          ? controller.allumeFlash()
                                          : controller.eteindreFlash();
                                    },
                                    child: CircleAvatar(
                                      radius: 30.r,
                                      child: GetBuilder<CameraScanController>(
                                          id: 'flash',
                                          builder: (controller) {
                                            return AnimatedSwitcher(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              child: controller.controller.value
                                                          .flashMode ==
                                                      FlashMode.off
                                                  ? const Icon(
                                                      Icons.flash_off_outlined)
                                                  : const Icon(
                                                      Icons.flash_on_outlined),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.pickImage();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5).r,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: const Icon(
                                      Icons.image_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                GetBuilder<CameraScanController>(
                                    id: 'capture',
                                    builder: (controller) {
                                      return Align(
                                        alignment: Alignment.bottomCenter,
                                        child: AnimatedSwitcher(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          child: controller.capturing == true
                                              ? SizedBox(
                                                  height: 70.r,
                                                  width: 70.r,
                                                  child:
                                                      const CircularProgressIndicator(
                                                    backgroundColor:
                                                        Colors.white,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.green),
                                                  ),
                                                )
                                              : GestureDetector(
                                                  onTap: () {
                                                    controller.takePicture();
                                                  },
                                                  child: CircleAvatar(
                                                    radius: 37.r,
                                                    backgroundColor:
                                                        Colors.green,
                                                    child: CircleAvatar(
                                                      radius: 33.r,
                                                      backgroundColor:
                                                          Colors.white,
                                                      child: CircleAvatar(
                                                        radius: 29.r,
                                                        backgroundColor:
                                                            Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        ),
                                      );
                                    }),
                                SizedBox(width: 20.w),
                                Opacity(
                                  opacity: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(5).r,
                                    child: const Icon(
                                      Icons.send_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
          ),
        );
      }
    });
  }
}
