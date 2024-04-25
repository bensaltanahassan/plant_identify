import 'package:plant_identify/core/class/crud.dart';
import 'package:plant_identify/core/constant/linkapi.dart';

class FavorisData {
  Crud crud;
  FavorisData(this.crud);
  getData({
    required String userId,
    required String token,
  }) async {
    var response = await crud.getData(
        linkUrl: "${AppLinks.favoris}/$userId", token: token);
    return response.fold((l) => l, (r) => r);
  }

  addData({
    required String userId,
    required String productId,
    required String token,
  }) async {
    var response = await crud.postData(
        linkUrl: AppLinks.favoris,
        data: {
          "userId": userId,
          "productId": productId,
        },
        token: token);
    return response.fold((l) => l, (r) => r);
  }

  deleteData({
    required String favId,
    required String token,
  }) async {
    var response = await crud.deleteData(
      linkUrl: "${AppLinks.favoris}/$favId",
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }
}
