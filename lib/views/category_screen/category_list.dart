import 'package:adminapp/const/colors.dart';
import 'package:adminapp/fuctions/delproductfunction.dart';
import 'package:adminapp/views/category_screen/addcate.dart';
import 'package:adminapp/views/insidecategories/inside_category..dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        title: const Text('Category List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('categories').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot documentsnampshot =
                        snapshot.data!.docs[index];

                    return Card(
                      color: kblue,
                      child: ListTile(
                        onTap: () {
                          Get.to(
                              () => InsideCategory(
                                  brand: documentsnampshot['name']),
                              transition: Transition.zoom,
                              duration: const Duration(seconds: 1));
                        },
                        title: Text(documentsnampshot['name'],
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        trailing: IconButton(
                            onPressed: () {
                              delectcategories(
                                  categories: documentsnampshot['name']);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: kred,
                            )),
                      ),
                    );
                  },
                );
              } else {
                return const Text('There is no Data');
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => Addcate());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
