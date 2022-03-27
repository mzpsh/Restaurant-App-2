// import 'dart:convert';

class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  // late List foods;
  // late List drinks;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
      );
}

// double checkDouble(dynamic value) {
//   if (value is int) {
//     return value.toDouble();
//   } else {
//     return value;
//   }
// }

// List<Restaurant> parseArticles(String? json) {
//   if (json == null) {
//     return [];
//   }

//   final Map<String, dynamic> parsedMap = jsonDecode(json);
//   final List parsed = parsedMap['restaurants'];
//   return parsed.map((json) => Restaurant.fromJson(json)).toList();
// }
