import 'dart:developer';

import 'package:adminapp/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

delproduct({required ProductModel product}) {
  final remove = FirebaseFirestore.instance
      .collection('categories')
      .doc('rolex')
      .collection('rolex')
      .doc(product.doc);
  remove.delete();
  log('delected');
}
