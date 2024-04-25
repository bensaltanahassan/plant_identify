import 'package:plant_identify/core/class/crud.dart';
import 'package:plant_identify/core/constant/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData({required String token}) async {
    var response = await crud.getData(linkUrl: AppLinks.homepage, token: token);
    return response.fold((l) => l, (r) => r);
  }
}
