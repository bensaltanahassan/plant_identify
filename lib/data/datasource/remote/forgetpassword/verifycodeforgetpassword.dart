import 'package:plant_identify/core/class/crud.dart';
import 'package:plant_identify/core/constant/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postData(String email, String verifyCode, {String? userPhone = ""}) async {
    var response = await crud.postData(
        linkUrl: AppLinks.verifycodeforgetpassword,
        data: {
          "users_email": email,
          "users_verifycode": verifyCode,
          "users_phone": userPhone
        });
    return response.fold((l) => l, (r) => r);
  }
}
