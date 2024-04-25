import 'package:plant_identify/data/model/product_model.dart';
import 'package:plant_identify/data/model/user_model.dart';

class FavorisModel {
  String? favId;
  ProductModel? product;
  UserModel? user;
  int? version;

  FavorisModel({this.favId, this.product, this.user, this.version});

  FavorisModel.fromJson(Map<String, dynamic> json) {
    favId = json['_id'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = favId;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['version'] = version;
    return data;
  }
}
