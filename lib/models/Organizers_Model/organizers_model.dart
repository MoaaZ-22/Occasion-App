class OrganizerHomeModel {
  String? massege;
  List<Data>? data;

  OrganizerHomeModel({this.massege, this.data});

  OrganizerHomeModel.fromJson(Map<String, dynamic> json) {
    massege = json['massege'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
//ff
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['massege'] = massege;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? about;
  String? image;
  String? imageprofile;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.about,
        this.image,
        this.imageprofile,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    about = json['about'];
    image = json['image'];
    imageprofile = json['imageprofile'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['about'] = about;
    data['image'] = image;
    data['imageprofile'] = imageprofile;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}