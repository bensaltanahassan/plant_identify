import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plant_identify/controllers/history/history_controller.dart';
import 'package:plant_identify/data/model/plant_model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<HistoryController>()) {
      Get.find<HistoryController>().getHistory();
    } else {
      Get.put(HistoryController()).getHistory();
    }
    return GetBuilder<HistoryController>(builder: (controller) {
      if (controller.history.isEmpty) {
        return Center(
          child: Text(
            "No History",
            style: TextStyle(fontSize: 20.sp),
          ),
        );
      } else {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding:
              const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10).r,
          itemBuilder: (c, i) => CustomHistoryElement(
            p: controller.history[i],
            onDismissed: (_) {
              controller.deleteHistory(p: controller.history[i]);
            },
          ),
          separatorBuilder: (c, i) => Divider(height: 20.h),
          itemCount: controller.history.length,
        );
      }
    });
  }
}

class CustomHistoryElement extends StatelessWidget {
  const CustomHistoryElement({
    super.key,
    required this.p,
    this.onDismissed,
  });
  final PlantModelInformation p;
  final void Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<HistoryController>().goToPlanrDetails(p: p);
      },
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: onDismissed,
        background: Container(
          color: Colors.red,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: SizedBox(
          height: 100.h,
          width: Get.width,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Hero(
                  tag: p.localImagePath!,
                  child: Image.file(
                    File(p.localImagePath!),
                    height: 100.h,
                    width: 100.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p.className ?? '',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: Get.width - 140,
                      child: Text(
                        p.description ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Text(
                      DateFormat('dd MMMM yyyy hh:mm a')
                          .format(DateTime.parse(p.date ?? '')),
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
