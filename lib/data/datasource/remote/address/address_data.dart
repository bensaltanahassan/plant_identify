import 'package:plant_identify/core/class/crud.dart';
import 'package:plant_identify/core/constant/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  addAddress({
    required String userId,
    required String name,
    required String city,
    required String street,
    required double long,
    required double lat,
    required String token,
  }) async {
    var response = await crud.postData(
      linkUrl: AppLinks.address,
      data: {
        "user": userId,
        "name": name,
        "city": city,
        "street": street,
        "long": long,
        "lat": lat,
      },
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }

  getAllAddress({
    required String userId,
    required String token,
  }) async {
    var response = await crud.getData(
      linkUrl: "${AppLinks.address}/$userId",
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }

  updateAddress({
    required String addressId,
    required String token,
    required Map<String, dynamic> data,
  }) async {
    var response = await crud.putData(
      linkUrl: "${AppLinks.address}/$addressId",
      token: token,
      data: data,
    );
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress({required String addressId, required String token}) async {
    var response = await crud.deleteData(
        linkUrl: "${AppLinks.address}/$addressId", token: token);
    return response.fold((l) => l, (r) => r);
  }
}
