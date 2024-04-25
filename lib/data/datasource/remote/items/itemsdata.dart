import 'package:plant_identify/core/class/crud.dart';
import 'package:plant_identify/core/constant/linkapi.dart';

class ProductsData {
  Crud crud;
  ProductsData(this.crud);

  getAllProducts({required String token, Map<String, dynamic>? filtre}) async {
    var response = await crud.getData(
      linkUrl: AppLinks.products,
      queryParameters: filtre,
      token: token,
    );
    return response.fold((l) => l, (r) => r);
  }
}
