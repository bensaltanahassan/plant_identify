import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_identify/core/class/statusrequest.dart';
import 'package:plant_identify/core/constant/imageassets.dart';

class HandlingDataView extends StatelessWidget {
  const HandlingDataView({
    super.key,
    this.statusRequest,
    required this.child,
    this.loadingWidget,
  });
  final StatusRequest? statusRequest;
  final Widget? loadingWidget;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (statusRequest == StatusRequest.loading) {
      if (loadingWidget != null) {
        return loadingWidget!;
      }
      return Center(
          child: Lottie.asset(
        AppImageAsset.loading,
        width: 100.w,
        height: 100.h,
      ));
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Center(child: Lottie.asset(AppImageAsset.offline));
    } else if (statusRequest == StatusRequest.serverfailure) {
      return Center(child: Lottie.asset(AppImageAsset.server));
    } else if (statusRequest == StatusRequest.failure) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppImageAsset.nodata,
            width: 160.w,
            height: 160.h,
          ),
          Text("No plant detected in the image.",
              style: TextStyle(fontSize: 20.sp)),
        ],
      );
    } else {
      return child;
    }
  }
}
