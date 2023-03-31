import 'package:adminapp/const/const.dart';
import 'package:adminapp/fuctions/updateproduct.dart';
import 'package:adminapp/model/product_model.dart';
import 'package:adminapp/views/editscreen/widget/editimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProduct extends StatelessWidget {
  EditProduct({
    required this.productModel,
    Key? key,
    required this.brand,
  }) : super(key: key);
  final ProductModel productModel;
  final String brand;
  late final nameconroller = TextEditingController(text: productModel.name);
  late final priceconroller = TextEditingController(text: productModel.price);
  late final displayconroller =
      TextEditingController(text: productModel.displaytype);
  late final quantityconroller =
      TextEditingController(text: productModel.quantity);
  late final modelconroller =
      TextEditingController(text: productModel.modelname);
  late final strapcolourconroller =
      TextEditingController(text: productModel.strapcolour);
  late final straptypeconroller =
      TextEditingController(text: productModel.straptype);
  late final warrantyperiodconroller =
      TextEditingController(text: productModel.warrantyperiod);
  late final dualtimeconroller =
      TextEditingController(text: productModel.dualtime);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product'),
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
              EditImageWidget(image: productModel.imagelist),
              kheight50,
              ElevatedButton(
                  onPressed: () async {
                    await updateproduct(
                        product: ProductModel(
                            doc: productModel.doc,
                            name: nameconroller.text,
                            price: priceconroller.text,
                            quantity: quantityconroller.text,
                            displaytype: displayconroller.text,
                            modelname: modelconroller.text,
                            strapcolour: strapcolourconroller.text,
                            straptype: straptypeconroller.text,
                            warrantyperiod: warrantyperiodconroller.text,
                            dualtime: dualtimeconroller.text,
                            imagelist: productModel.imagelist),
                        brand: brand);
                    Get.back();
                  },
                  child: const Text('edit'))
            ],
          ),
        ));
  }
}
