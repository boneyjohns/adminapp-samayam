import 'dart:developer';
import 'package:adminapp/model/cateModel.dart';
import 'package:adminapp/model/product_model.dart';
import 'package:adminapp/views/category_screen/category_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

Future addproduct(
    {required ProductModel product, required String brandname}) async {
  final add = FirebaseFirestore.instance
      .collection('categories')
      .doc(brandname)
      .collection(brandname)
      .doc(product.doc);
  final json = product.toJson();
  await add.set(json);
  log('added');
}

Future addcategory({required CateModel cate}) async {
  final add =
      FirebaseFirestore.instance.collection('categories').doc(cate.name);
  final json = cate.toJson();

  await add.set(json);
  log('added cate');
  Get.to(CategoryList());
}
