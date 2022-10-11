

class HallHomeModel {
  bool? success;
  List<HallHomeData>? data;

  HallHomeModel({this.success, this.data});

  HallHomeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <HallHomeData>[];
      json['data'].forEach((v) {
        data!.add(HallHomeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HallHomeData {
  var id;
  var name;
  var price;
  var location;
  var rate;
  var images;
  var imagesProfile;
  var catgoery;
  var createdAt;
  var updatedAt;

  HallHomeData(
      {this.id,
        this.name,
        this.price,
        this.location,
        this.rate,
        this.images,
        this.imagesProfile,
        this.catgoery,
        this.createdAt,
        this.updatedAt});

  HallHomeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    location = json['location'];
    rate = json['Rate'];
    images = json['images'];
    imagesProfile = json['images_profile'];
    catgoery = json['Catgoery'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['location'] = location;
    data['Rate'] = rate;
    data['images'] = images;
    data['images_profile'] = imagesProfile;
    data['Catgoery'] = catgoery;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
