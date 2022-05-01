class ProductModel {
  String id;
  String image;
  String name;
  int price;
  String description;
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    this.isFavorite = false
  });
}
