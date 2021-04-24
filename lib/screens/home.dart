import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:newshop/common/less_syntax.dart';
import 'package:newshop/model/product_model.dart';
import 'package:newshop/screens/product_details.dart';
import 'package:newshop/services/auth_services.dart';
import 'package:newshop/services/product_service.dart';
import 'package:newshop/widget/alert_dialog_box.dart';
import 'package:newshop/widget/product_card.dart';
import 'package:newshop/widget/side_drawer.dart';
import 'package:newshop/widget/toast.dart';
import 'package:newshop/screens/cart_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;

  bool _disposed = false;

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  Future<bool> showAlertBox() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialogBox(
        textMessage: 'Do you really want to logout?',
      ),
    );
  }

  Future<bool> onPressedBack() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialogBox(
        textMessage: 'Do you really want to close the app?',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onPressedBack,
      child: Scaffold(
        drawer: SideDrawer(
          onLogout: () async {
            bool result = await showAlertBox();
            if (result ?? false) {
              try {
                setState(() {
                  isLoading = true;
                });
                await AuthService().logout();
                if (!_disposed) {
                  setState(() {
                    isLoading = false;
                  });
                }
                ToastClass.buildShowToast('Logged out');
              } catch (e) {
                print(e.toString());
                setState(() {
                  isLoading = false;
                });
              }
            }
          },
        ),
        appBar: AppBar(
          elevation: 0.0,
          title: Text('HOME PAGE'),
          actions: [
            IconButton(
                highlightColor: Colors.green,
                icon: Icon(Icons.search_rounded, color: black),
                onPressed: () {}),
            IconButton(
                highlightColor: Colors.green,
                icon: Icon(Icons.shopping_cart, color: black),
                onPressed: () {
                  changeScreen(
                    context,
                    Cart(),
                  );
                }),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.amber,
                height: 300,
                width: 349,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  images: [
                    AssetImage('images/bracelate.png'),
                    AssetImage('images/BANNER2.png'),
                    AssetImage('images/BANNER_TRY.png'),
                    AssetImage('images/earrings.png'),
                  ],
                  //autoplay: true,
                  indicatorBgPadding: 2.0,
                  dotSize: 10.0,
                  dotBgColor: Colors.transparent,
                  dotColor: Colors.amberAccent,
                  animationCurve: Curves.ease,
                  animationDuration: Duration(milliseconds: 300),
                  dotIncreasedColor: Colors.black,
                ),
              ),
            ),
            SizedBox(
              //width: 10,
              height: 8,
            ),
            Center(
              child: Text(
                'PRODUCTS',
                style: TextStyle(color: Colors.green, fontSize: 25),
              ),
            ),
            // ProductCard(),
            SizedBox(
              //width: 10,
              height: 8,
            ),
            Expanded(
              child: StreamBuilder<List<ProductModel>>(
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
            ),
          ],
        ),
      ),
    );
  }
}
