// // import 'dart:convert';

// // RestaurantResult restaurantResultFromJson(String str) =>
// //     RestaurantResult.fromJson(json.decode(str));

// // String restaurantResultToJson(RestaurantResult data) =>
// //     json.encode(data.toJson());

// class RestaurantResult {
//   RestaurantResult({
//     required this.error,
//     required this.message,
//     required this.count,
//     required this.restaurant,
//   });

//   bool error;
//   String message;
//   int count;
//   Restaurant restaurant;
//   // List<Restaurant> restaurants;

//   factory RestaurantResult.fromJson(Map<String, dynamic> json) =>
//       RestaurantResult(
//         error: json["error"],
//         message: json["message"],
//         count: json["count"],
//         restaurant: Restaurant.fromJson(json["restaurant"]),
//         // restaurants: List<Restaurant>.from(
//         //   (json["restaurants"] as List)
//         //       .map((x) => Restaurant.fromJson(x))
//         //       .where((restaurants) =>
//         //           restaurants.id != null &&
//         //           restaurants.name != null &&
//         //           restaurants.description != null &&
//         //           restaurants.pictureId != null &&
//         //           restaurants.city != null &&
//         //           restaurants.rating != null),
//         // ),
//       );

//   // Map<String, dynamic> toJson() => {
//   //       "error": error,
//   //       "message": message,
//   //       "count": count,
//   //       "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
//   //     };
// }

// class Restaurant {
//   Restaurant({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.pictureId,
//     required this.city,
//     required this.address,
//     required this.rating,
//     // required this.menus,
//   });

//   String id;
//   String name;
//   String description;
//   String pictureId;
//   String city;
//   String address;
//   // Menus menus;
//   double rating;

//   factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         pictureId: json["pictureId"],
//         city: json["city"],
//         address: json["address"],
//         rating: json["rating"].toDouble(),
//       );

//   // Map<String, dynamic> toJson() => {
//   //       "id": id,
//   //       "name": name,
//   //       "description": description,
//   //       "pictureId": pictureId,
//   //       "city": city,
//   //       "rating": rating,
//   //     };
// }

class RestaurantResult {
  RestaurantResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  bool error;
  String message;
  Restaurant restaurant;

  factory RestaurantResult.fromJson(Map<String, dynamic> json) =>
      RestaurantResult(
        error: json["error"],
        message: json["message"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
      );
}

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
  });

  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
      );
}
