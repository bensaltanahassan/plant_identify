import 'package:plant_identify/core/class/crud.dart';
import 'package:plant_identify/core/constant/linkapi.dart';

class CouponsData {
  Crud crud;
  CouponsData(this.crud);
  getAllCoupons({required String token}) async {
    var response = await crud.getData(linkUrl: AppLinks.coupons, token: token);
    return response.fold((l) => l, (r) => r);
  }

  addCoupon({
    required String token,
    required String name,
    required double value,
    required int count,
    required DateTime expireDate,
  }) async {
    var response = await crud.postData(
        linkUrl: AppLinks.coupons,
        token: token,
        data: {
          "name": name,
          "value": value,
          "count": count,
          "expireDate": expireDate
        });
    return response.fold((l) => l, (r) => r);
  }

  verifyCoupon({required String token, required String couponName}) async {
    var response = await crud.getData(
      linkUrl: "${AppLinks.coupons}/verifycoupon/?name=$couponName",
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }
  //
}
