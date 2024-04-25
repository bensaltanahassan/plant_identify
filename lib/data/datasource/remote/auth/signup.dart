import 'package:plant_identify/core/class/crud.dart';
import 'package:plant_identify/core/constant/linkapi.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    var response = await crud.postData(linkUrl: AppLinks.signup, data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
