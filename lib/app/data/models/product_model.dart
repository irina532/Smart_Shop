class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating? rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      price: (json["price"] ?? 0).toDouble(),  // <-- FIXED
      description: json["description"] ?? "",
      category: json["category"] ?? "",
      image: json["image"] ?? "",
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating?.toJson(),
  };

  @override
  String toString() {
    return "$id, $title, $price, $description, $category, $image, $rating";
  }
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  final double rate;
  final int count;

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json["rate"] ?? 0).toDouble(),   // <-- FIXED
      count: json["count"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };

  @override
  String toString() {
    return "$rate, $count";
  }
}