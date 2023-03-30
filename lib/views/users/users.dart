import 'package:adminapp/views/users/userorders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Userside extends StatelessWidget {
  const Userside({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Users',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return Card(
                      color: Colors.blue,
                      child: ListTile(
                          onTap: () {
                            Get.to(() =>
                                Userorders(email: documentSnapshot['email']));
                          },
                          leading: SizedBox(width: 10),
                          title: Text(
                            documentSnapshot['email'],
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(
                            Icons.email,
                            color: Colors.red,
                          )),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                );
              } else {
                return const Align(
                  alignment: FractionalOffset.center,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
            }),
      ),
    );
  }
}
