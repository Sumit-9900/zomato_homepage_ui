import 'dart:convert';

class BiryaniModel {
  final Biryani biryani;

  BiryaniModel({required this.biryani});

  BiryaniModel copyWith({Biryani? biryani}) =>
      BiryaniModel(biryani: biryani ?? this.biryani);

  factory BiryaniModel.fromRawJson(String str) =>
      BiryaniModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BiryaniModel.fromJson(Map<String, dynamic> json) =>
      BiryaniModel(biryani: Biryani.fromJson(json["biryani"]));

  Map<String, dynamic> toJson() => {"biryani": biryani.toJson()};
}

class Biryani {
  final List<Recommended> recommended;
  final List<Recommended> restaurants;

  Biryani({required this.recommended, required this.restaurants});

  Biryani copyWith({
    List<Recommended>? recommended,
    List<Recommended>? restaurants,
  }) => Biryani(
    recommended: recommended ?? this.recommended,
    restaurants: restaurants ?? this.restaurants,
  );

  factory Biryani.fromRawJson(String str) => Biryani.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Biryani.fromJson(Map<String, dynamic> json) => Biryani(
    recommended: List<Recommended>.from(
      json["recommended"].map((x) => Recommended.fromJson(x)),
    ),
    restaurants: List<Recommended>.from(
      json["restaurants"].map((x) => Recommended.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "recommended": List<dynamic>.from(recommended.map((x) => x.toJson())),
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}

class Recommended {
  final int id;
  final String title;
  final List<String> imageUrl;
  final String deliveryTime;
  final double rating;
  final String distanceFromHere;
  final String specialOrder;
  final String offer;
  final bool isAd;

  Recommended({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.deliveryTime,
    required this.rating,
    required this.distanceFromHere,
    required this.specialOrder,
    required this.offer,
    required this.isAd,
  });

  Recommended copyWith({
    int? id,
    String? title,
    List<String>? imageUrl,
    String? deliveryTime,
    double? rating,
    String? distanceFromHere,
    String? specialOrder,
    String? offer,
    bool? isAd,
  }) => Recommended(
    id: id ?? this.id,
    title: title ?? this.title,
    imageUrl: imageUrl ?? this.imageUrl,
    deliveryTime: deliveryTime ?? this.deliveryTime,
    rating: rating ?? this.rating,
    distanceFromHere: distanceFromHere ?? this.distanceFromHere,
    specialOrder: specialOrder ?? this.specialOrder,
    offer: offer ?? this.offer,
    isAd: isAd ?? this.isAd,
  );

  factory Recommended.fromRawJson(String str) =>
      Recommended.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recommended.fromJson(Map<String, dynamic> json) => Recommended(
    id: json["id"],
    title: json["title"],
    imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
    deliveryTime: json["deliveryTime"],
    rating: json["rating"],
    distanceFromHere: json["distanceFromHere"],
    specialOrder: json["specialOrder"],
    offer: json["offer"],
    isAd: json["isAd"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
    "deliveryTime": deliveryTime,
    "rating": rating,
    "distanceFromHere": distanceFromHere,
    "specialOrder": specialOrder,
    "offer": offer,
    "isAd": isAd,
  };
}
