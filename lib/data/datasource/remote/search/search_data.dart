import 'package:plant_identify/core/class/crud.dart';
import 'package:plant_identify/core/constant/linkapi.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  getData({required String name}) async {
    var response =
        await crud.getData(linkUrl: "${AppLinks.search}/?name=$name");
    return response.fold((l) => l, (r) => r);
  }
}
