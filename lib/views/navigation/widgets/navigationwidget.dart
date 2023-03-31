import 'package:adminapp/const/colors.dart';
import 'package:flutter/material.dart';

class Navigationwidget extends StatelessWidget {
  const Navigationwidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      color: kblue,
      child: Center(
          child: Text(
        title,
        style: const TextStyle(color: kwhite, fontSize: 22),
      )),
    );
  }
}
