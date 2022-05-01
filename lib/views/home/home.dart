import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_pangan/models/cart_model.dart';
import 'package:store_pangan/models/product_model.dart';
import 'package:store_pangan/views/home/favorite_fragment.dart';
import 'package:store_pangan/views/home/home_fragment.dart';
import 'package:store_pangan/views/home/profile_fragment.dart';
import 'package:store_pangan/data/products_dataset.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ProductModel> _mainProducts = productsDataset;
  List<ProductModel> _favoriteProducts = [];
  List<CartModel> _cartProducts = [];

  Widget? _getFragment(int index) {
    Widget? fragment;

    switch(index) {
      case 0:
        fragment = HomeFragment(
          products: _mainProducts,
          cartProducts: _cartProducts,
          onProductsChanged: (List<ProductModel> products) {
            setState(() {
              _mainProducts = products;
              _favoriteProducts = _mainProducts.where((product) => product.isFavorite).toList();
            });
          },
          onCartAdded: (CartModel addedCart) {
            setState(() {
              Function isProductOnCart = () {
                bool isOnCart = false;

                _cartProducts.forEach((product) {
                  if (product.id == addedCart.id)  {
                    isOnCart = true;
                  }
                });

                return isOnCart;
              };

              if (isProductOnCart()) {
                _cartProducts = _cartProducts.map((product) {
                  if (product.id == addedCart.id)  {
                    product.ammounts += addedCart.ammounts;
                  }

                  return product;
                }).toList();
              } else {
                _cartProducts.add(addedCart);
              }
            });
          }
        );
        break;
      case 1:
        fragment = FavoriteFragment(
          favoriteProducts: _favoriteProducts,
          onProductsChanged: (List<ProductModel> products) {
            setState(() {
              _mainProducts = products;
              _favoriteProducts = _mainProducts.where((product) => product.isFavorite).toList();
            });
          },
          onCartAdded: (CartModel addedCart) {
            setState(() {
              bool isOnCart = false;

              _cartProducts.forEach((product) {
                if (product.id == addedCart.id)  {
                  isOnCart = true;
                }
              });

              if (isOnCart) {
                _cartProducts = _cartProducts.map((product) {
                  if (product.id == addedCart.id)  {
                    product.ammounts += addedCart.ammounts;
                  }

                  return product;
                }).toList();
              } else {
                _cartProducts.add(addedCart);
              }
            });
          },
        );
        break;
      case 2:
        fragment = ProfileFragment();
        break;
    }

    return fragment;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          activeColor: Colors.white,
          inactiveColor: Colors.white,
          backgroundColor: Color(0xff504e4e),
          iconSize: 24.0,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.house_fill),
              icon: Icon(CupertinoIcons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.heart_fill),
              icon: Icon(CupertinoIcons.heart),
              label: 'WhishList'
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.person_fill),
              icon: Icon(CupertinoIcons.person),
              label: 'About'
            )
          ]
        ),
        tabBuilder: (BuildContext context, index) {
          return _getFragment(index)!;
        }
      )
    );
  }
}