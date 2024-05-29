import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_identify/controllers/plant_details/plant_details_controller.dart';
import 'package:plant_identify/core/class/handlingdataview.dart';
import 'package:plant_identify/data/model/plant_model.dart';

class PlantDetailes extends StatelessWidget {
  const PlantDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    final PlantDetailController controller = Get.put(PlantDetailController());
    return Scaffold(
        body: NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 400.h,
            floating: true,
            leading: const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                  tag: controller.image!.path,
                  child: Image.file(File(controller.image!.path),
                      fit: BoxFit.cover)),
            ),
          ),
        ];
      },
      body: MediaQuery.removePadding(
        context: context,
        child: GetBuilder<PlantDetailController>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10).r,
                physics: const BouncingScrollPhysics(),
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20)
                          .r,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                controller.plantModeInformation?.image ?? "",
                                height: 40.h,
                                width: 40.w,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                controller.plantModeInformation?.className ??
                                    "",
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 200.w,
                                child: LinearProgressIndicator(
                                  minHeight: 10,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  value: double.parse(controller
                                          .plantModeInformation
                                          ?.confidenceType ??
                                      "0"),
                                  backgroundColor: Colors.grey,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Colors.green),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "${(controller.plantModeInformation?.confidenceType ?? 0.0)} %",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Text("Model Accuracy",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomCardPlantDetails(
                    speakingProgress: controller.progressAbout,
                    title: "About",
                    isSpeaking: controller.isSpeakingAbout,
                    icon: Icons.question_mark_outlined,
                    text: controller.plantModeInformation?.description ?? "",
                    onPressedSpeaker: () {
                      controller.speak(
                        text:
                            controller.plantModeInformation?.description ?? "",
                        widgetId: "speak_about",
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  if (controller.plantModeInformation?.nutritions != null)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Plant Information",
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        HealthyPlant(
                          plantModeInformation:
                              controller.plantModeInformation!,
                        ),
                      ],
                    ),
                  if (controller.plantModeInformation?.pathogen != null)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pathogen",
                          style: TextStyle(
                            fontSize: 26.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        UnHealthyPlant(
                            plantModeInformation:
                                controller.plantModeInformation!)
                      ],
                    ),

                  // Wrap(
                  //   spacing: 20.w,
                  //   runSpacing: 10.h,
                  //   children: [
                  //     ...controller.healthyNutrition!
                  //         .toJson()
                  //         .entries
                  //         .map((e) => CustomWrapElement(
                  //               title: e.key,
                  //               subTitle: e.value.toString(),
                  //             ))
                  //   ],
                  // )
                ]),
          );
        }),
      ),
    ));
  }
}

class HealthyPlant extends StatelessWidget {
  const HealthyPlant({
    super.key,
    required this.plantModeInformation,
  });

  final PlantModelInformation plantModeInformation;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                CustomWrapElement(
                  title: "energy (kcal/kJ)",
                  subTitle: plantModeInformation.nutritions?.energyKcalKJ ?? "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "water (g)",
                  subTitle:
                      plantModeInformation.nutritions?.waterG?.toString() ?? "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "protein (g)",
                  subTitle:
                      plantModeInformation.nutritions?.proteinG?.toString() ??
                          "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "total fat (g)",
                  subTitle:
                      plantModeInformation.nutritions?.totalFatG?.toString() ??
                          "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "carbohydrates (g)",
                  subTitle: plantModeInformation.nutritions?.carbohydratesG
                          ?.toString() ??
                      "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "fiber (g)",
                  subTitle: plantModeInformation.nutritions?.fiberG ?? "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "sugars (g)",
                  subTitle: plantModeInformation.nutritions?.sugarsG ?? "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "calcium (mg)",
                  subTitle:
                      plantModeInformation.nutritions?.calciumMg?.toString() ??
                          "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "iron (mg)",
                  subTitle:
                      plantModeInformation.nutritions?.ironMg?.toString() ?? "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "magnessium (mg)",
                  subTitle: plantModeInformation.nutritions?.magnessiumMg
                          ?.toString() ??
                      "",
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: Colors.green,
            thickness: 1,
          ),
          Expanded(
            child: Column(
              children: [
                CustomWrapElement(
                  title: "phosphorus (mg)",
                  subTitle: plantModeInformation.nutritions?.phosphorusMg
                          ?.toString() ??
                      "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "potassium (mg)",
                  subTitle: plantModeInformation.nutritions?.potassiumMg
                          ?.toString() ??
                      "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "sodium (g)",
                  subTitle:
                      plantModeInformation.nutritions?.sodiumG?.toString() ??
                          "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "vitamin A (IU)",
                  subTitle:
                      plantModeInformation.nutritions?.vitaminAIU?.toString() ??
                          "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "vitamin C (mg)",
                  subTitle:
                      plantModeInformation.nutritions?.vitaminCMg?.toString() ??
                          "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "vitamin B1 (mg)",
                  subTitle: plantModeInformation.nutritions?.vitaminB1Mg
                          ?.toString() ??
                      "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "vitamin B2 (mg)",
                  subTitle: plantModeInformation.nutritions?.vitaminB2Mg
                          ?.toString() ??
                      "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "vitamin B3 (mg)",
                  subTitle: plantModeInformation.nutritions?.viatminB3Mg
                          ?.toString() ??
                      "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "vitamin B5 (mg)",
                  subTitle: plantModeInformation.nutritions?.vitaminB5Mg
                          ?.toString() ??
                      "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "vitamin B6 (mg)",
                  subTitle: plantModeInformation.nutritions?.vitaminB6Mg
                          ?.toString() ??
                      "",
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "vitamin E (mg)",
                  subTitle: plantModeInformation.nutritions?.vitaminEMg ?? "",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UnHealthyPlant extends StatelessWidget {
  const UnHealthyPlant({
    super.key,
    required this.plantModeInformation,
  });

  final PlantModelInformation plantModeInformation;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                CustomWrapElement(
                  title: "Bacteria",
                  subTitle: plantModeInformation.pathogen![0].value.toString(),
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "Fungi",
                  subTitle: plantModeInformation.pathogen![1].value.toString(),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: Colors.green,
            thickness: 1,
          ),
          Expanded(
            child: Column(
              children: [
                CustomWrapElement(
                  title: "Pest",
                  subTitle: plantModeInformation.pathogen![2].value.toString(),
                ),
                SizedBox(height: 10.h),
                CustomWrapElement(
                  title: "Virus",
                  subTitle: plantModeInformation.pathogen![3].value.toString(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomWrapElement extends StatelessWidget {
  const CustomWrapElement({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(title,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500)),
        ),
        Expanded(
          child: Text(subTitle,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              )),
        ),
      ],
    );
  }
}

class CustomCardPlantDetails extends StatelessWidget {
  const CustomCardPlantDetails({
    super.key,
    required this.title,
    required this.icon,
    required this.text,
    this.onPressedSpeaker,
    required this.speakingProgress,
    this.isSpeaking = false,
  });

  final String title;
  final IconData icon;
  final String text;
  final void Function()? onPressedSpeaker;
  final bool isSpeaking;
  final double speakingProgress;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10).r,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
                ),
                Icon(
                  icon,
                  size: 26.sp,
                  weight: 30,
                )
              ],
            ),
            const Divider(),
            Text(text),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 50.h,
                width: 50.w,
                child: Stack(
                  children: [
                    IconButton(
                      constraints: BoxConstraints.tight(Size(40.w, 40.h)),
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      color: Colors.white,
                      onPressed: onPressedSpeaker,
                      icon: Icon(
                        Icons.volume_up_outlined,
                        size: 20.r,
                      ),
                    ),
                    if (isSpeaking)
                      SizedBox(
                        height: 50.h,
                        width: 50.w,
                        child: CircularProgressIndicator(
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.green),
                          value: speakingProgress,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
