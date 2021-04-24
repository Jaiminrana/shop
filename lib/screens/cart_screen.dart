import 'package:flutter/material.dart';  
import 'package:newshop/common/cart_fake_product.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed:null)
        ],
      ),

    body: Cart_products(),


      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children:<Widget>[
            Expanded(
              child:ListTile(
                title:Text('Total:'),
                subtitle:Text('Rs.11,999')
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                  onPressed: (){},
                  child: Text('Check out',
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                  color: Colors.amber,
                ),
              ),
              ),


          ],
        ) ,
      ),
    );
  }
}