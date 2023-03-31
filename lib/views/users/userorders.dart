import 'package:adminapp/const/colors.dart';
import 'package:adminapp/const/const.dart';
import 'package:adminapp/fuctions/orderfunstion.dart';
import 'package:adminapp/model/ordermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Userorders extends StatelessWidget {
  const Userorders({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundcolor,
        appBar: AppBar(
          title: const Text('Orders'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(email)
                  .collection('order')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      separatorBuilder: (context, index) => kheight20,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        QueryDocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        return Container(
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: kblue),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: kwhite),
                                      child: Image.network(
                                        documentSnapshot['images'][0],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    kheight20,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            width: 100,
                                            child: Text(
                                              maxLines: 1,
                                              '${documentSnapshot['name']}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Text('₹${documentSnapshot['price']}'),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: const Color.fromARGB(
                                                    255, 12, 139, 55),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            onPressed: () {
                                              acceptrejectOrder(
                                                  orderModel: OrderModel(
                                                      isCanceled: false,
                                                      isDelivered: true,
                                                      id: documentSnapshot[
                                                          'id']),
                                                  email: email);
                                            },
                                            child: const Text(
                                              'Accept Order',
                                              style: TextStyle(color: kwhite),
                                            )),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: kred,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            onPressed: () {
                                              acceptrejectOrder(
                                                  orderModel: OrderModel(
                                                      isCanceled: true,
                                                      isDelivered: false,
                                                      id: documentSnapshot[
                                                          'id']),
                                                  email: email);
                                            },
                                            child: const Text(
                                              'Reject Order',
                                              style: TextStyle(color: kwhite),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return const Align(
                    alignment: FractionalOffset.center,
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
