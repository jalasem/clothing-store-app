class Product {
  // properties
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String image;
  final double rating;
  final int ratingCount;

  // constructor
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.image,
    required this.rating,
    required this.ratingCount,
  });

  // factory from json
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: double.parse(json['price'].toString()),
      image: json['image'] ?? '',
      rating: double.parse(json['rating']['rate'].toString()),
      ratingCount: json['rating']?['count'] ?? 0,
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'image': image,
      'rating': {
        'rate': rating,
        'count': ratingCount,
      },
    };
  }
}
