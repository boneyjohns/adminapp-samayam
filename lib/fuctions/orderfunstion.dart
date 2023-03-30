import 'package:adminapp/model/ordermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future acceptrejectOrder(
    {required OrderModel orderModel, required String email}) async {
  final userdoc = FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('order')
      .doc(orderModel.id);

  final json = orderModel.toJson();

  await userdoc.update(json);
}
