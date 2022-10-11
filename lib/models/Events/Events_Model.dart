class OdaModel {
  String? massege;
  List<Data>? data;

  OdaModel({this.massege, this.data});

  OdaModel.fromJson(Map<String, dynamic> json) {
    massege = json['massege'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['massege'] = this.massege;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  var id;
  var name;
  var image;
  var dateTime;
  var address;
  var about;
  var price;
  var typeof;
  var duration;
  var createdAt;
  var updatedAt;

  Data(
      {this.id,
        this.name,
        this.image,
        this.dateTime,
        this.address,
        this.about,
        this.price,
        this.typeof,
        this.duration,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    dateTime = json['date_time'];
    address = json['address'];
    about = json['about'];
    price = json['price'];
    typeof = json['typeof'];
    duration = json['duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['date_time'] = this.dateTime;
    data['address'] = this.address;
    data['about'] = this.about;
    data['price'] = this.price;
    data['typeof'] = this.typeof;
    data['duration'] = this.duration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

