class DetailsOfHotelsModel {
  var message;
  List<Product>? product;
  List<Info>? info;
  List<Images>? images;
  List<ReviewHall>? reviewHall;
  List<Deal>? deal;

  DetailsOfHotelsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
    if (json['info'] != null) {
      info = <Info>[];
      json['info'].forEach((v) {
        info!.add(new Info.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['reviewHall'] != null) {
      reviewHall = <ReviewHall>[];
      json['reviewHall'].forEach((v) {
        reviewHall!.add(new ReviewHall.fromJson(v));
      });
    }
    if (json['deal'] != null) {
      deal = <Deal>[];
      json['deal'].forEach((v) {
        deal!.add(new Deal.fromJson(v));
      });
    }
  }
}

class Product {
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


  Product.fromJson(Map<String, dynamic> json) {
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

}

class Info {
  var id;
  var aboutAs;
  var start;
  var end;
  var review;
  var deals;
  var nameHalls;
  var createdAt;
  var updatedAt;


  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aboutAs = json['about_as'];
    start = json['start'];
    end = json['end'];
    review = json['review'];
    deals = json['Deals'];
    nameHalls = json['Name_Halls'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class Images {
  var id;
  var name;
  var infoId;
  var createdAt;
  var updatedAt;

  Images({this.id, this.name, this.infoId, this.createdAt, this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    infoId = json['info_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class ReviewHall {
  var id;
  var rate;
  var comments;
  var productId;
  var userId;
  var createdAt;
  var updatedAt;


  ReviewHall.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['Rate'];
    comments = json['comments'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class Deal {
  var id;
  var name;
  var pricce;
  var hall;
  var numberInvities;
  var foods;
  var numberParagraphs;
  var numberHours;
  var updatedAt;
  var createdAt;



  Deal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pricce = json['pricce'];
    hall = json['Hall'];
    numberInvities = json['number_invities'];
    foods = json['Foods'];
    numberParagraphs = json['Number_Paragraphs'];
    numberHours = json['Number_hours'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }


}