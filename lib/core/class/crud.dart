import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:plant_identify/core/class/statusrequest.dart';

class Crud {
  final dio = Dio();
  Future<Either<StatusRequest, Map>> getData({
    required String linkUrl,
    String? token = '',
    Map? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      // if (await checkInternet()) {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response = await dio.get(linkUrl,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            headers: requestHeaders,
            validateStatus: (status) => true,
          ));
      if (response.statusCode != 500) {
        Map responseBody = response.data;
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
      // } else {
      // return const Left(StatusRequest.offlinefailure);
      // }
    } catch (e) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> postData(
      {required String linkUrl,
      required Object data,
      String? token = ''}) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token!}'
      };
      var response = await dio.post(
        linkUrl,
        data: data,
        options: Options(
          headers: requestHeaders,
          validateStatus: (status) => true,
        ),
      );

      if (response.statusCode != 500) {
        Map responseBody = response.data;
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> putData({
    required String linkUrl,
    required Object data,
    String token = '',
  }) async {
    try {
      // if (await checkInternet()) {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response = await dio.put(
        linkUrl,
        data: data,
        options: Options(
          headers: requestHeaders,
          validateStatus: (status) => true,
        ),
      );

      if (response.statusCode != 500) {
        Map responseBody = response.data;

        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
      // } else {
      //   return const Left(StatusRequest.offlinefailure);
      // }
    } catch (e) {
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> deleteData(
      {required String linkUrl, Map? data, required String token}) async {
    try {
      // if (await checkInternet()) {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var response = await dio.delete(
        linkUrl,
        data: data,
        options: Options(
          headers: requestHeaders,
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode != 500) {
        Map responseBody = response.data;

        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
      // } else {
      //   return const Left(StatusRequest.offlinefailure);
      // }
    } catch (e) {
      return const Left(StatusRequest.serverException);
    }
  }
}
