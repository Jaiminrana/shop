import 'package:flutter/material.dart';
import 'package:newshop/common/less_syntax.dart';
import 'package:newshop/model/product_model.dart';
import 'package:newshop/services/product_service.dart';
import 'package:newshop/widget/product_card.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:newshop/screens/cart_screen.dart';
import './home.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;
  const ProductDetails({Key key, this.product}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _key = GlobalKey<ScaffoldState>();
   
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      key: _key,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.amber,
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
          },
          child: Text(
            'Product Description',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                print("=============cartScreen");
                changeScreen(
                  context,
                  Cart(),
                );
              }),
        ],
      ),
      body: SingleChildScrollView (
              child: Column(//ListView
          children: [
            Container(
              height: 300,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child:
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image:widget.product.image,
                        fit: BoxFit.fill,
                        height: 400,
                        width: double.infinity,
                      ),
                      //Image.asset('images/pexels-photo-2697748.jpeg'),
                ),
                footer: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text(
                      //'Ring',
                      widget.product.name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                           // 'Rs.10,000',
                            "Rs:${widget.product.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.black45),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      print("=============cartScreen");
                      //changeScreen(context, Cart(),);
                    },
                    color: Colors.amber,
                    textColor: Colors.black,
                    elevation: 0.3,
                    child: Text("Buy Now"),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.add_shopping_cart, color: Colors.red),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(Icons.favorite_border_rounded, color: Colors.red),
                    onPressed: () {}),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.share,
                    color: Colors.green,
                  ),
                ),
                //  Icon(icon: Icon(Icons.share,color:Colors.green),
                //    onPressed:(){}),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.green,
                    textColor: Colors.black,
                    elevation: 0.3,
                    child: Text("WhatsApp Us"),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.redAccent,
            ),
            ListTile(
              title: Text('Product Specification'),
            ),
            Column(
              children: <Widget>[
                /*Container(
                   color: Colors.white70,
                   height: 150,
                   width: 180,
                   child: Image.asset('images/net_gross_weight_icon.png'),

                 ),
                  Container(
                   color: Colors.white70,
                   height: 150,
                   width: 180,
                   child: Image.asset('images/NET_WEIGHT.png'),
                 ),
                 Container(
                   color: Colors.white70,
                   height: 150,
                   width: 180,
                   child: Image.asset('images/hallmark_icon.png'),
                 ),*/
                Card(
                  margin: EdgeInsets.fromLTRB(20, 6, 20, 000),
                  child: ListTile(
                    leading: Image.asset(
                      'images/hallmark_icon.png',
                      width: 45,
                      height: 44,
                    ),
                    title: Text('916 certified'),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(20, 6, 20, 000),
                  child: ListTile(
                    leading: Image.asset(
                      'images/gold_icons.png',
                      width: 45,
                      height: 44,
                    ),
                    title: Text('22 carat Gold'),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(20, 6, 20, 000),
                  child: ListTile(
                    leading: Image.asset(
                      'images/net_gross_weight_icon.png',
                      width: 45,
                      height: 44,
                    ),
                    title: Text('50 GRAMS'),
                    subtitle: Text('Net Gross Weight'),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(20, 6, 20, 000),
                  child: ListTile(
                    leading: Image.asset(
                      'images/NET_WEIGHTSS.png',
                      width: 45,
                      height: 44,
                    ),
                    title: Text('10 GRAMS'),
                    subtitle: Text('Net Weight'),
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Similar Products'),
                ),
                Container(
                    height: 20,
                    child: Text(
                        'todo similar product implementation') //Similar_products(),
                    ),
                    // Container(
                    //   color: Colors.black,
               // child: 
               StreamBuilder<List<ProductModel>>(
                  stream: ProductService().productsFromDatabase,
                  builder: (context, snapshots) {
                    if (snapshots.data != null) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshots.data.length,
                        itemBuilder: (context, index) {
                          print(snapshots.data[index].id);
                          return GestureDetector(
                            onTap: (){
                              changeScreen(context, ProductDetails(product: snapshots.data[index],));
                              // Navigator.push(context, MaterialPageRoute(
                              //       builder: (context) {
                              //         ProductDetails(product: snapshots.data[index],);
                              //       },
                              // ),);
                               },
                            child: ProductCard(
                              product: snapshots.data[index],
                            ),
                          );
                        },
                      );
                    } else {
                      print('data is not getting');
                      return CircularProgressIndicator();
                    }
                  },
                ),
              //),
              ],
            )
          ],
        ),
      ),
    );
  }
}
/*
class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
 var product_list=[
    {
      "name":"ear ring",
      "image":"images/earrings.png",
      "price":1999,
    },  

    {
      "name":"bracelate",
      "image":"images/bracelate.png",
      "price":10000,
    },
    {
      "name":"pandent",
      "image":"images/pandent.png",
      "price":10000,
    },
    {
      "name":"ring",
      "image":"images/PRODUCTS_RING.png",
      "price":10000,
    },
    {
      "name":"mangalsutra",
      "image":"images/mangalsutra.png",
      "price":10000,
    },
     
    
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2),
      itemBuilder: (BuildContext context,int index){
        return Similar_Single_product(
          product_name: product_list[index]['name'],
          product_image: product_list[index]['image'],
          product_price: product_list[index]['price'],
        );
      },
    );
  }
}


class Similar_Single_product extends StatelessWidget {
  
  final product_name;
  final product_image;
  final product_price;

  Similar_Single_product({
    this.product_name,
    this.product_image,
    this.product_price
    });
  
  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Hero(
        tag: product_name,
        child: Material(
          child: InkWell(
            onTap: ()=>Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=> ProductDetails(
                product_detail_name: product_name,
                product_detail_image: product_image,
                product_detail_price: product_price,
              ),
              ),
            ),
            child: GridTile(
              footer:Container(
                //color: Colors.white70,
                child: ListTile(
                  leading: Text(product_name,style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text('Rs:$product_price',
                  style: TextStyle(color:Colors.red,fontWeight: FontWeight.w800,fontSize:15),
                  ),
                ),
              ),
              child: Image.asset(product_image,
              fit:BoxFit.cover,
            ),
          ),
        ),
      ),
    ),
    );
  }
}
*/
