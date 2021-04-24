import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'dart:async';
import 'package:newshop/model/product_model.dart';

class ProductService {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String collectionName = 'products';

 List<ProductModel> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return ProductModel(
        brand:doc.get('brand') ,
        id:doc.get('id'),
        name: doc.get('name'),
        price:doc.get('price') ,
        category: doc.get('category'),
        image: doc.get('image'),
      );
    }).toList();
  }


  //stream of category
  Stream<List<ProductModel>> get productsFromDatabase {
    String productCollectionName = 'products';
    final CollectionReference productCollection =
        _firebaseFirestore.collection(productCollectionName);
    return productCollection.snapshots().map(_productListFromSnapshot);
  }
  
  }