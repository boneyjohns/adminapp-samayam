import 'package:adminapp/fuctions/updateproduct.dart';
import 'package:adminapp/model/product_model.dart';
import 'package:adminapp/views/editscreen/widget/editimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProduct extends StatelessWidget {
  EditProduct(
      {Key? key,
      required this.brand,
      required this.name,
      required this.price,
      required this.quantity,
      required this.displaytype,
      required this.modelname,
      required this.strapcolour,
      required this.straptype,
      required this.warrantyperiod,
      required this.dualtime,
      required this.docc,
      required this.imagelist})
      : super(key: key);
  final String brand;
  final String name;
  final String price;
  final String quantity;
  final String displaytype;
  final String modelname;
  final String strapcolour;
  final String straptype;
  final String warrantyperiod;
  final String dualtime;
  final List imagelist;
  final String docc;

  late final nameconroller = TextEditingController(text: name);
  late final priceconroller = TextEditingController(text: price);
  late final displayconroller = TextEditingController(text: displaytype);
  late final quantityconroller = TextEditingController(text: quantity);
  late final modelconroller = TextEditingController(text: modelname);
  late final strapcolourconroller = TextEditingController(text: strapcolour);
  late final straptypeconroller = TextEditingController(text: straptype);
  late final warrantyperiodconroller =
      TextEditingController(text: warrantyperiod);
  late final dualtimeconroller = TextEditingController(text: dualtime);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Product'),
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
              EditImageWidget(image: imagelist),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    updateproduct(
                        product: ProductModel(
                            doc: docc,
                            name: nameconroller.text,
                            price: priceconroller.text,
                            quantity: quantityconroller.text,
                            displaytype: displayconroller.text,
                            modelname: modelconroller.text,
                            strapcolour: strapcolourconroller.text,
                            straptype: straptypeconroller.text,
                            warrantyperiod: warrantyperiodconroller.text,
                            dualtime: dualtimeconroller.text,
                            imagelist: imagelist),
                        brand: brand);
                    Get.back();
                  },
                  child: Text('edit'))
            ],
          ),
        ));
  }
}
