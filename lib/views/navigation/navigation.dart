import 'package:adminapp/views/category_screen/category_list.dart';
import 'package:adminapp/views/users/users.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => Userside());
            },
            child: Container(
              height: 200,
              width: 300,
              color: Colors.blue,
              child: Center(
                  child: Text(
                'Users',
                style: TextStyle(color: Colors.white, fontSize: 22),
              )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => Get.to(() => CategoryList()),
            child: Container(
              height: 200,
              width: 300,
              color: Colors.blue,
              child: Center(
                  child: Text(
                'Products',
                style: TextStyle(color: Colors.white, fontSize: 22),
              )),
            ),
          ),
        ],
      )),
    );
  }
}
