class OrderDetailModel {
  String? orderId;
  String? user;
  double? price;
  String? coupon;
  String? address;
  int? number;
  String? deliveryType;
  double? shippingPrice;
  double? totalPrice;
  String? paymentMethod;
  String? status;
  bool? deleted;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Products>? products;

  OrderDetailModel(
      {this.orderId,
      this.user,
      this.number,
      this.price,
      this.coupon,
      this.address,
      this.deliveryType,
      this.shippingPrice,
      this.totalPrice,
      this.paymentMethod,
      this.status,
      this.deleted,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.products});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    user = json['user'];
    price = double.parse(json['price'].toString());
    number = json['number'];
    coupon = json['coupon'] ?? "";
    address = json['address'] ?? "";
    deliveryType = json['deliveryType'];
    shippingPrice = double.parse(json['shippingPrice'].toString());
    totalPrice = double.parse(json['totalPrice'].toString());
    paymentMethod = json['paymentMethod'];
    status = json['status'];
    deleted = json['deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['number'] = number;
    data['user'] = user;
    data['price'] = price;
    data['coupon'] = coupon;
    data['address'] = address;
    data['deliveryType'] = deliveryType;
    data['shippingPrice'] = shippingPrice;
    data['totalPrice'] = totalPrice;
    data['paymentMethod'] = paymentMethod;
    data['status'] = status;
    data['deleted'] = deleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? sId;
  Product? product;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Products(
      {this.sId,
      this.product,
      this.quantity,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['quantity'] = quantity;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Product {
  String? sId;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  int? price;
  int? count;
  int? discount;
  bool? isActive;
  int? nbrOfSell;
  List<Images>? images;
  Category? category;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Product(
      {this.sId,
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
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
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
    data['__v'] = iV;
    return data;
  }
}

class Images {
  String? url;
  String? publicId;

  Images({this.url, this.publicId});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    publicId = json['publicId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['publicId'] = publicId;
    return data;
  }
}

class Category {
  String? sId;
  String? name;
  String? description;
  Images? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Category(
      {this.sId,
      this.name,
      this.description,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'] != null ? Images.fromJson(json['image']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['description'] = description;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
