class UserModel {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  ProfilePhoto? profilePhoto;
  bool? isAdmin;
  bool? isAccountVerified;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? token;

  UserModel(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.profilePhoto,
      this.isAdmin,
      this.isAccountVerified,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    profilePhoto = json['profilePhoto'] != null
        ? ProfilePhoto.fromJson(json['profilePhoto'])
        : null;
    isAdmin = json['isAdmin'];
    isAccountVerified = json['isAccountVerified'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    if (profilePhoto != null) {
      data['profilePhoto'] = profilePhoto!.toJson();
    }
    data['isAdmin'] = isAdmin;
    data['isAccountVerified'] = isAccountVerified;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['token'] = token;
    return data;
  }
}

class ProfilePhoto {
  String? url;
  String? publicId;

  ProfilePhoto({this.url, this.publicId});

  ProfilePhoto.fromJson(Map<String, dynamic> json) {
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
