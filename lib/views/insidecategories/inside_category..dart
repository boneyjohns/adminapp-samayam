import 'dart:developer';

import 'package:adminapp/fuctions/delproductfunction.dart';
import 'package:adminapp/model/product_model.dart';
import 'package:adminapp/views/addproduct/add_product.dart';
import 'package:adminapp/views/editscreen/edit_product.dart';
import 'package:adminapp/views/productdetails/view_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsideCategory extends StatelessWidget {
  const InsideCategory({Key? key, required this.brand}) : super(key: key);

  final String brand;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(brand.toString()),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('categories')
              .doc(brand)
              .collection(brand)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Get.to(() => ProductView(
                            brand: brand,
                            docc: documentSnapshot['doc'],
                            name: documentSnapshot['name'],
                            price: documentSnapshot['price'],
                            quantity: documentSnapshot['quantity'],
                            displaytype: documentSnapshot['displaytype'],
                            modelname: documentSnapshot['modelname'],
                            strapcolour: documentSnapshot['strapcolour'],
                            straptype: documentSnapshot['straptype'],
                            warrantyperiod: documentSnapshot['warrantyperiod'],
                            dualtime: documentSnapshot['dualtime'],
                            imagelist: documentSnapshot['image'].toList()));
                      },
                      title: Text(documentSnapshot['name']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.to(() => EditProduct(
                                    brand: brand,
                                    docc: documentSnapshot['doc'],
                                    name: documentSnapshot['name'],
                                    price: documentSnapshot['price'],
                                    quantity: documentSnapshot['quantity'],
                                    displaytype:
                                        documentSnapshot['displaytype'],
                                    modelname: documentSnapshot['modelname'],
                                    strapcolour:
                                        documentSnapshot['strapcolour'],
                                    straptype: documentSnapshot['straptype'],
                                    warrantyperiod:
                                        documentSnapshot['warrantyperiod'],
                                    dualtime: documentSnapshot['dualtime'],
                                    imagelist:
                                        documentSnapshot['image'].toList()));
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                delproduct(
                                    brandname: brand,
                                    product: ProductModel(
                                        doc: documentSnapshot['doc'],
                                        name: documentSnapshot['name'],
                                        price: documentSnapshot['price'],
                                        quantity: documentSnapshot['quantity'],
                                        displaytype:
                                            documentSnapshot['displaytype'],
                                        modelname:
                                            documentSnapshot['modelname'],
                                        strapcolour:
                                            documentSnapshot['strapcolour'],
                                        straptype:
                                            documentSnapshot['straptype'],
                                        warrantyperiod:
                                            documentSnapshot['warrantyperiod'],
                                        dualtime: documentSnapshot['dualtime'],
                                        imagelist: documentSnapshot['image']
                                            .toList()));
                                log('delected');
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Text('nodata');
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddProduct(
                brand: brand,
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
