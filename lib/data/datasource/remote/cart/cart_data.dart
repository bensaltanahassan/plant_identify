import 'package:plant_identify/core/class/crud.dart';
import 'package:plant_identify/core/constant/linkapi.dart';

class Cartdata {
  Crud crud;
  Cartdata(this.crud);
  getData({required String userId, required String token}) async {
    var response =
        await crud.getData(linkUrl: "${AppLinks.cart}/$userId", token: token);
    return response.fold((l) => l, (r) => r);
  }

  postData({
    required String userId,
    required String productId,
    required String token,
    required int quantity,
  }) async {
    var response = await crud.postData(
      linkUrl: AppLinks.cart,
      token: token,
      data: {"productId": productId, "userId": userId, "quantity": quantity},
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteData({required String cartId, required String token}) async {
    var response = await crud.deleteData(
      linkUrl: "${AppLinks.cart}/$cartId",
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }

  putData(
      {required String cartId,
      required String token,
      required int quantity}) async {
    var response = await crud.putData(
      linkUrl: "${AppLinks.cart}/$cartId",
      token: token,
      data: {"quantity": quantity},
    );
    return response.fold((l) => l, (r) => r);
  }
}
