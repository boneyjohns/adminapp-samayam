import 'package:adminapp/const/colors.dart';
import 'package:flutter/material.dart';

class PageViewWidget extends StatelessWidget {
  PageViewWidget({
    required this.productimage,
    Key? key,
  }) : super(key: key);

  final List productimage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: kwhite,
        //borderRadius: BorderRadius.circular(20)
      ),
      child: PageView.builder(
        itemCount: productimage.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Image.network(productimage[index]);
        },
      ),
    );
  }
}
