import 'package:plant_identify/data/model/user_model.dart';

class AddressModel {
  UserModel? user;
  String? city;
  String? name;
  String? street;
  double? lat;
  double? long;
  String? addressId;
  int? version;

  AddressModel(
      {this.user,
      this.city,
      this.name,
      this.street,
      this.lat,
      this.long,
      this.addressId,
      this.version});

  AddressModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    city = json['city'];
    name = json['name'];
    street = json['street'];
    lat = double.parse(json['lat'].toString());
    long = double.parse(json['long'].toString());
    addressId = json['_id'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['name'] = name;
    data['street'] = street;
    data['lat'] = lat;
    data['long'] = long;
    return data;
  }
}
