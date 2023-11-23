import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var totalPri = 0.obs;

  void calculate(List<DocumentSnapshot> data) {
    totalPri.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalPri.value =
          totalPri.value + int.parse(data[i]['totalPrice'].toString());
    }
  }
}
