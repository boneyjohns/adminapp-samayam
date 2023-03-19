import 'package:adminapp/fuctions/addproduct_fun.dart';
import 'package:adminapp/model/cateModel.dart';
import 'package:adminapp/views/addproduct/add_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addcate extends StatelessWidget {
  Addcate({Key? key}) : super(key: key);
  TextEditingController nameconroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add cate'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              TextFormField(
                controller: nameconroller,
                decoration:
                    const InputDecoration(labelText: 'Name of the Product'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await addcategory(
                        cate: CateModel(
                      name: nameconroller.text,
                    ));
                  },
                  child: Text('Add'))
            ],
          ),
        ));
  }
}
