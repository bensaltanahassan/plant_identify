class ImageModel {
  String? url;
  String? publicId;

  ImageModel({this.url, this.publicId});

  ImageModel.fromJson(Map<String, dynamic> json) {
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
