import 'package:plant_identify/data/model/categoriesmodel.dart';

import './image_model.dart';

class ProductModel {
  String? productId;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  int? price;
  int? count;
  int? discount;
  bool? isActive;
  int? nbrOfSell;
  List<ImageModel>? images;
  CategoryModel? category;
  String? createdAt;
  String? updatedAt;
  int? version;

  ProductModel(
      {this.productId,
      this.name,
      this.nameAr,
      this.description,
      this.descriptionAr,
      this.price,
      this.count,
      this.discount,
      this.isActive,
      this.nbrOfSell,
      this.images,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.version});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['_id'];
    name = json['name'];
    nameAr = json['nameAr'];
    description = json['description'];
    descriptionAr = json['descriptionAr'];
    price = json['price'];
    count = json['count'];
    discount = json['discount'];
    isActive = json['isActive'];
    nbrOfSell = json['nbrOfSell'];
    if (json['images'] != null) {
      images = <ImageModel>[];
      json['images'].forEach((v) {
        images!.add(ImageModel.fromJson(v));
      });
    }
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['name'] = name;
    data['nameAr'] = nameAr;
    data['description'] = description;
    data['descriptionAr'] = descriptionAr;
    data['price'] = price;
    data['count'] = count;
    data['discount'] = discount;
    data['isActive'] = isActive;
    data['nbrOfSell'] = nbrOfSell;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['version'] = version;
    return data;
  }
}
