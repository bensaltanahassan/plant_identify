import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:plant_identify/core/class/crud.dart';
import 'package:plant_identify/core/constant/linkapi.dart';

class PredictionData {
  Crud crud;
  PredictionData(this.crud);
  sendImage({
    required File image,
  }) async {
    var response = await crud.postData(
      linkUrl: AppLinks.predict,
      data: dio.FormData.fromMap({
        "file": await dio.MultipartFile.fromFile(
          image.path,
          filename: image.path.split("/").last,
        )
      }),
    );
    return response.fold((l) => l, (r) => r);
  }
}
