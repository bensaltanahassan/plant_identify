import 'package:plant_identify/core/class/crud.dart';
import 'package:plant_identify/core/constant/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postData(String email, String password) async {
    var response = await crud.putData(linkUrl: AppLinks.resetpassword, data: {
      "users_email": email,
      "newpassword": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
