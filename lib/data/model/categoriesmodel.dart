import './image_model.dart';

class CategoryModel {
  String? categoryId;
  String? name;
  String? description;
  ImageModel? image;
  String? createdAt;
  String? updatedAt;
  int? version;

  CategoryModel({
    this.categoryId,
    this.name,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    version = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['name'] = name;
    data['description'] = description;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}
