class ProfileModel {
  String? message;
  List<Offer>? offer;
  List<Comments>? comments;

  ProfileModel({
    this.message,
    this.offer,
    this.comments
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['offer'] != null) {
      offer = <Offer>[];
      json['offer'].forEach((v) {
        offer!.add(new Offer.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    if (offer != null) {
      data['offer'] = offer!.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offer {
  int? id;
  String? name;
  String? image;
  String? imageProfile;
  String? offerName;
  String? offerDescription;
  int? price;
  String? createdAt;
  String? dateTime;
  String? updatedAt;
  int? teamid;

  Offer(
      {this.id,
        this.name,
        this.image,
        this.imageProfile,
        this.offerName,
        this.offerDescription,
        this.price, this.createdAt,
        this.dateTime,
        this.updatedAt,
        this.teamid});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    imageProfile = json['image_profile'];
    offerName = json['offer_name'];
    offerDescription = json['offer_description'];
    price = json['price'];
    createdAt = json['created_at'];
    dateTime = json['date_time'];
    updatedAt = json['updated_at'];
    teamid = json['teamid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['image_profile'] = imageProfile;
    data['offer_name'] = offerName;
    data['offer_description'] =offerDescription;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['date_time'] = dateTime;
    data['updated_at'] = updatedAt;
    data['teamid'] = teamid;
    return data;
  }
}

class Comments {
  int? id;
  String? comments;
  String? rate;
  int? teamId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Comments(
      {this.id,
        this.comments,
        this.rate,
        this.teamId,
        this.userId,
        this.createdAt,
        this.updatedAt
      });

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comments = json['comments'];
    rate = json['Rate'];
    teamId = json['teamId'];
    userId = json['userId'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['comments'] = comments;
    data['Rate'] = rate;
    data['teamId'] = teamId;
    data['userId'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  }
