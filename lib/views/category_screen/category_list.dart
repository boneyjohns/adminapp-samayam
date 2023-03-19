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
      appBar: AppBar(
        title: const Text('Category List'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
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
                    child: ListTile(
                      onTap: () {
                        Get.to(InsideCategory(brand: documentsnampshot['name']),
                            transition: Transition.zoom,
                            duration: const Duration(seconds: 3));
                      },
                      title: Text(documentsnampshot['name']),
                    ),
                  );
                },
              );
            } else {
              return const Text('empty');
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(Addcate());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
