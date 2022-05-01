import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_pangan/components/favorite_item.dart';
import 'package:store_pangan/models/cart_model.dart';
import 'package:store_pangan/models/product_model.dart';

import '../detail_product.dart';

class FavoriteFragment extends StatelessWidget {
  final List<ProductModel> favoriteProducts;
  final void Function(List<ProductModel>) onProductsChanged;
  final void Function(CartModel) onCartAdded;

  FavoriteFragment({ 
    required this.favoriteProducts,
    required this.onProductsChanged,
    required this.onCartAdded
  });
  
  void _setFavorite(ProductModel favoriteProduct) {
    onProductsChanged(favoriteProducts.map((product) {
        if (product.id == favoriteProduct.id) {
          product.isFavorite = favoriteProduct.isFavorite;
        }

        return product;
      }).toList()
    );
  }

  void _navigateDetailPage(BuildContext context, ProductModel product) async {
    var result = await Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return DetailProduct(product: product);
    }));

    if (result != null) {
      if (result is CartModel) {
        _setFavorite(ProductModel(
            id: result.id,
            image: result.image,
            name: result.name,
            price: result.price,
            description: result.description,
            isFavorite: result.isFavorite
          )
        );
        onCartAdded(result);
      } else {
        _setFavorite(result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(      
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  heading(),
                  body(context)
                ]
              )
            ),
          ],
        )
      )
    );
  }

  Widget heading() {
    return Column(
      children: [
        Text(
          'WhistList',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: GoogleFonts.sourceSansPro(
            decoration: TextDecoration.none,
            height: 2,
            fontSize: 26.0,
            fontWeight: FontWeight.w600,
            color: Color(0xff404040)
          )
        ),
        Text(
          '${favoriteProducts.length} Item',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.center,
          style: GoogleFonts.sourceSansPro(
            decoration: TextDecoration.none,
            fontSize: 20.0,
            color: Color(0xff595959)
          )
        ),
        SizedBox(height: 25.0),
      ],
    );
  }

  Widget body(BuildContext context) {
    return Expanded(
      child: ListView(
        children: favoriteProducts.map((product) => GestureDetector(
          onTap: () {
            _navigateDetailPage(context, product);
          },
          child: FavoriteItem(product: product),
        )).toList(),
      ),
    );
  }
}
