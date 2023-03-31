import 'package:adminapp/fuctions/addproduct_fun.dart';
import 'package:adminapp/model/cateModel.dart';
import 'package:flutter/material.dart';

class Addcate extends StatelessWidget {
  Addcate({Key? key}) : super(key: key);
  final TextEditingController nameconroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Category'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameconroller,
                decoration:
                    const InputDecoration(labelText: 'Name of the Category'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await addcategory(
                        cate: CateModel(
                      name: nameconroller.text,
                    ));
                  },
                  child: const Text('Add'))
            ],
          ),
        ));
  }
}
