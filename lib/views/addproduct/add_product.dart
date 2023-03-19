import 'package:adminapp/fuctions/addproduct_fun.dart';
import 'package:adminapp/model/product_model.dart';
import 'package:adminapp/views/addproduct/widget/add_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  AddProduct({Key? key, required this.brand}) : super(key: key);
  TextEditingController nameconroller = TextEditingController();
  TextEditingController priceconroller = TextEditingController();
  TextEditingController quantityconroller = TextEditingController();
  TextEditingController displayconroller = TextEditingController();
  TextEditingController modelconroller = TextEditingController();
  TextEditingController strapcolourconroller = TextEditingController();
  TextEditingController straptypeconroller = TextEditingController();
  TextEditingController warrantyperiodconroller = TextEditingController();
  TextEditingController dualtimeconroller = TextEditingController();
  final String brand;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Product'),
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
              TextFormField(
                controller: priceconroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
              ),
              TextFormField(
                controller: quantityconroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Quantity'),
              ),
              TextFormField(
                controller: displayconroller,
                decoration: const InputDecoration(labelText: 'Display Type'),
              ),
              TextFormField(
                controller: modelconroller,
                decoration: const InputDecoration(labelText: 'Model Name'),
              ),
              TextFormField(
                controller: strapcolourconroller,
                decoration: const InputDecoration(labelText: 'Strap Color'),
              ),
              TextFormField(
                controller: straptypeconroller,
                decoration: const InputDecoration(labelText: 'Strap Type'),
              ),
              TextFormField(
                controller: warrantyperiodconroller,
                decoration: const InputDecoration(labelText: 'Warranty Period'),
              ),
              TextFormField(
                controller: dualtimeconroller,
                decoration: const InputDecoration(labelText: 'Dual Time'),
              ),
              AddImageWidget(),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await addproduct(
                        brandname: brand,
                        product: ProductModel(
                            doc: nameconroller.text,
                            name: nameconroller.text,
                            price: priceconroller.text,
                            quantity: quantityconroller.text,
                            displaytype: displayconroller.text,
                            modelname: modelconroller.text,
                            strapcolour: strapcolourconroller.text,
                            straptype: straptypeconroller.text,
                            warrantyperiod: warrantyperiodconroller.text,
                            dualtime: dualtimeconroller.text,
                            imagelist: image));
                    Get.back();
                  },
                  child: Text('Add'))
            ],
          ),
        ));
  }
}
