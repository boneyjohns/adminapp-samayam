import 'dart:developer';

import 'package:adminapp/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

updateproduct({required ProductModel product, required String brand}) async {
  final update = FirebaseFirestore.instance
      .collection('categories')
      .doc(brand)
      .collection(brand)
      .doc(product.doc);
  final json = product.toJson();
  await update.update(json);
  log('update');
  final search =
      FirebaseFirestore.instance.collection('search').doc(product.doc);

  await search.update(json);
  log('addtosearch');
}
