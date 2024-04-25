import 'package:plant_identify/data/model/product_model.dart';
import 'package:plant_identify/data/model/user_model.dart';

class CartModel {
  String? cartId;
  UserModel? user;
  ProductModel? product;
  int? quantity;
  String? orderId;
  int? version;

  CartModel({this.cartId, this.user, this.product, this.version});

  CartModel.fromJson(Map<String, dynamic> json) {
    cartId = json['_id'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
    quantity = json['quantity'];
    orderId = json['order'];
    version = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cartId'] = cartId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['quanity'] = quantity;
    data['order'] = orderId;
    data['version'] = version;
    return data;
  }
}
