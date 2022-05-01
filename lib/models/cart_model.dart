import 'package:store_pangan/models/product_model.dart';

class CartModel extends ProductModel {
  bool isFavorite;
  int ammounts;

  CartModel({ 
    required String id,
    required String name,
    required String image,
    required String description,
    required int price,
    this.isFavorite = false,
    this.ammounts = 1 
  }) : super(
    id: id, 
    name: name, 
    description: description,
    image: image, 
    price: price,
    isFavorite: isFavorite
  );
}