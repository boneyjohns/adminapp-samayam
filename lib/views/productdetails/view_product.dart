import 'package:adminapp/views/productdetails/widget/page_view.dart';
import 'package:adminapp/views/productdetails/widget/productdetaillist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  ProductView(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageViewWidget(productimage: imagelist),
            Productdetails(detail: name, title: 'Product Name'),
            Productdetails(detail: price, title: 'Price'),
            Productdetails(detail: quantity, title: 'Quantity'),
            Productdetails(detail: displaytype, title: 'Displaytype'),
            Productdetails(detail: modelname, title: 'Model Name'),
            Productdetails(detail: strapcolour, title: 'Strap Colour'),
            Productdetails(detail: straptype, title: 'Strap Type'),
            Productdetails(detail: dualtime, title: 'Dual Time'),
            Productdetails(detail: warrantyperiod, title: 'Warrant Period'),
          ],
        ),
      ),
    );
  }
}
