class OrdersModel {
  String? orderId;
  String? user;
  double? price;
  String? coupon;
  String? address;
  String? deliveryType;
  int? shippingPrice;
  double? totalPrice;
  String? paymentMethod;
  String? status;
  bool? deleted;
  String? createdAt;
  String? updatedAt;
  int? number;
  int? v;

  OrdersModel(
      {this.orderId,
      this.user,
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
      this.number,
      this.v});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    orderId = json['_id'];
    number = json['number'];
    user = json['user'];
    price = double.parse(json['price'].toString());
    coupon = json['coupon'];
    address = json['address'];
    deliveryType = json['deliveryType'];
    shippingPrice = json['shippingPrice'];
    totalPrice = double.parse(json['totalPrice'].toString());
    paymentMethod = json['paymentMethod'];
    status = json['status'];
    deleted = json['deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
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
    data['number'] = number;
    data['updatedAt'] = updatedAt;
    data['v'] = v;
    return data;
  }
}
