import 'dart:developer';

import 'package:adminapp/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

delproduct({required ProductModel product, required String brandname}) {
  final remove = FirebaseFirestore.instance
      .collection('categories')
      .doc(brandname)
      .collection(brandname)
      .doc(product.doc);
  remove.delete();
  log('delected');
  final removefromsearch =
      FirebaseFirestore.instance.collection('search').doc(product.doc);
  removefromsearch.delete();
  log('product from search delected');
}

delectcategories({required String categories}) {
  final delectcat =
      FirebaseFirestore.instance.collection('categories').doc(categories);
  delectcat.delete();
}
