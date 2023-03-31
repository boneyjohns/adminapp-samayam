import 'package:adminapp/const/colors.dart';
import 'package:adminapp/model/product_model.dart';
import 'package:adminapp/views/productdetails/widget/page_view.dart';
import 'package:adminapp/views/productdetails/widget/productdetaillist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  ProductView({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kwhite,
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
            PageViewWidget(productimage: productModel.imagelist),
            Productdetails(detail: productModel.name, title: 'Product Name'),
            Productdetails(detail: productModel.price, title: 'Price'),
            Productdetails(detail: productModel.quantity, title: 'Quantity'),
            Productdetails(
                detail: productModel.displaytype, title: 'Displaytype'),
            Productdetails(detail: productModel.modelname, title: 'Model Name'),
            Productdetails(
                detail: productModel.strapcolour, title: 'Strap Colour'),
            Productdetails(detail: productModel.straptype, title: 'Strap Type'),
            Productdetails(detail: productModel.dualtime, title: 'Dual Time'),
            Productdetails(
                detail: productModel.warrantyperiod, title: 'Warrant Period'),
          ],
        ),
      ),
    );
  }
}
