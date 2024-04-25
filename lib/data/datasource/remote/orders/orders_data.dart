import 'package:plant_identify/core/class/crud.dart';
import 'package:plant_identify/core/constant/linkapi.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);
  getAllOrders({required String token, required String userId}) async {
    var reponse =
        await crud.getData(linkUrl: "${AppLinks.orders}/$userId", token: token);

    return reponse.fold((l) => l, (r) => r);
  }

  getSingleOrder(
      {required String token,
      required String userId,
      required String orderId}) async {
    var response = await crud.getData(
        linkUrl: "${AppLinks.orders}/$userId/$orderId", token: token);

    return response.fold((l) => l, (r) => r);
  }

  addOrders(
      {required String token,
      required Map<String, dynamic> data,
      required String userId}) async {
    var response = await crud.postData(
      linkUrl: AppLinks.checkout,
      token: token,
      data: data,
    );
    return response.fold((l) => l, (r) => r);
  }

  updateOrders(
      {required String token,
      required Map<String, dynamic> data,
      required String orderId,
      required String userId}) async {
    var response = await crud.putData(
        linkUrl: "${AppLinks.orders}/$userId/$orderId",
        token: token,
        data: data);
    return response.fold((l) => l, (r) => r);
  }

  deleteOrders(
      {required String token,
      required String orderId,
      required String userId}) async {
    var response = await crud.deleteData(
        linkUrl: "${AppLinks.orders}/$userId/$orderId", token: token);
    return response.fold((l) => l, (r) => r);
  }
}
