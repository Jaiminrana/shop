import 'package:flutter/material.dart';
import 'package:newshop/common/less_syntax.dart';
import 'package:newshop/screens/product_details.dart';
import 'package:newshop/model/product_model.dart';
class ProductCard extends StatefulWidget {
  final ProductModel product;

  const ProductCard({Key key, this.product}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height:210,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.product.image,)
                            //'https://images.pexels.com/photos/2697748/pexels-photo-2697748.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                      ),
                    ),
                  ),
                  FractionalTranslation(
                    translation: Offset(0, -0.5),
                    child: Container(
                      width: 160,
                      height: 70,
                      child: Center(
                          child: Text(widget.product.name,
                        //'Ring',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 5, color: Colors.white)),
                    ),
                  ),
                  FractionalTranslation(
                    translation: Offset(0, -1),
                    child: Text(
                      widget.product.price.toString(),
                      //'Rs.10000',
                      //'${product.price}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                  ),
                  Divider(
                    color: Colors.amber,
                    thickness: 2,
                  ),
                ],
              ),
            );
  }
}