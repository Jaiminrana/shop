import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  
  var Products_in_cart=[
    {
      "name":"ear ring",
      //"image":"images/travelimage4.jpeg",
      "image":"images/earrings.png",
      "price":"1,999",
      "type":"gold"
    },
    {
      "name":"Bracelate",
      "image":"images/bracelate.png",
      "price":"10,000",
      "type":"gold"
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: Products_in_cart.length,
      itemBuilder: (context,index){
        return Single_cart_product(
            cart_product_name: Products_in_cart[index]["name"],
            cart_product_image: Products_in_cart[index]["image"],
            cart_product_price: Products_in_cart[index]["price"],
            cart_product_type:Products_in_cart[index]["type"],
        );
      }, 
    );
    }
}

class Single_cart_product extends StatelessWidget {
  
  final cart_product_name;
  final cart_product_image;
  final cart_product_price;
  final cart_product_type;
  
  Single_cart_product({
    this.cart_product_image,
    this.cart_product_name,
    this.cart_product_price,
    this.cart_product_type,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cart_product_image,width:80,height:80,),
        title: Text(cart_product_name),
        subtitle: Column(children:<Widget> [
           Row(
             children: <Widget>[
               Text('type:'),
               Text(cart_product_type,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange),)
             ],
           ),
           Container(
             alignment: Alignment.topLeft,
             child: Text('Rs.${cart_product_price}',
             style: TextStyle(
               fontSize: 17,
               fontWeight: FontWeight.bold,
               color: Colors.green,
             ),
             ),
           ),
        ],
        ),
      ),
      
    );
  }
}