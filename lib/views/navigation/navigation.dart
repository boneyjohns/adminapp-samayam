import 'package:adminapp/const/colors.dart';
import 'package:adminapp/const/const.dart';
import 'package:adminapp/views/category_screen/category_list.dart';
import 'package:adminapp/views/navigation/widgets/navigationwidget.dart';
import 'package:adminapp/views/users/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => const Userside());
            },
            child: const Navigationwidget(title: 'Users'),
          ),
          kheight20,
          GestureDetector(
            onTap: () => Get.to(() => const CategoryList()),
            child: const Navigationwidget(title: "Products"),
          ),
        ],
      )),
    );
  }
}
