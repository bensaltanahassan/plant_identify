class CouponModel {
  String? couponId;
  String? name;
  int? count;
  int? value;
  String? expireDate;
  String? createdAt;
  String? updatedAt;
  int? version;

  CouponModel(
      {this.couponId,
      this.name,
      this.count,
      this.value,
      this.expireDate,
      this.createdAt,
      this.updatedAt,
      this.version});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['_id'];
    name = json['name'];
    count = json['count'];
    value = json['value'];
    expireDate = json['expireDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    version = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = couponId;
    data['name'] = name;
    data['count'] = count;
    data['value'] = value;
    data['expireDate'] = expireDate;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['version'] = version;
    return data;
  }
}
