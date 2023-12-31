// ignore_for_file: avoid_print

import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getUsername();
    super.onInit();
  }

  var currentNavIndex = 0.obs;

  var username = '';

  var searchController = TextEditingController();

  getUsername() async {
    if (currentUser != null) {
      var n = await firestore
          .collection(usersCollection)
          .where('id', isEqualTo: currentUser!.uid)
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          return value.docs.single['name'] as String?;
        }
      });

      // Check if n is not null before assigning to username
      if (n != null) {
        username = n;
        print(username);
      }
    }
  }
}
