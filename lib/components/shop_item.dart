import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_pangan/models/product_model.dart';
import 'package:store_pangan/utils/price_utils.dart';

class ShopItem extends StatefulWidget {
  final ProductModel product;
  final void Function(ProductModel) onFavoriteChanged;

  ShopItem({ required this.product, required this.onFavoriteChanged });
  
  @override
  State<ShopItem> createState() => _ShopItemState();
}

class _ShopItemState extends State<ShopItem> {
  void _setFavorite(ProductModel favoriteProduct) {
    setState(() {
      favoriteProduct.isFavorite = !widget.product.isFavorite;
      widget.onFavoriteChanged(favoriteProduct);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(widget.product.image)
                  )
                ),
                Positioned(
                  top: -5,
                  right: -5,
                  child: CupertinoButton(
                    onPressed: () {
                      _setFavorite(widget.product);
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1000)
                      ),
                      child: Icon(
                        !widget.product.isFavorite ? CupertinoIcons.heart : CupertinoIcons.heart_fill,
                        color: !widget.product.isFavorite ? Colors.black : Colors.redAccent
                      )
                    )
                  )
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.0),
            padding: EdgeInsets.only(left: 2, right: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.product.name,
                  textDirection: TextDirection.ltr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                    decoration: TextDecoration.none,
                    height: 1,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff373737)
                  )
                ),
                SizedBox(height: 2),
                Text(
                  'Rp ${PriceUtils.formatPrice(widget.product.price)} K',
                    textDirection: TextDirection.ltr,
                  style: GoogleFonts.roboto(
                      decoration: TextDecoration.none,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0ecc16)
                  )
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}
