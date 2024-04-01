class GetAllProductsModel {
  final num id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel? rating;

  GetAllProductsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory GetAllProductsModel.fromJson(jsonData) {
    return GetAllProductsModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: jsonData['rating'] == null
          ? null
          : RatingModel.fromJson(
              jsonData['rating'],
            ),
    );
  }
}

class RatingModel {
  final num rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: jsonData['rate'],
      count: jsonData['count'],
    );
  }
}
