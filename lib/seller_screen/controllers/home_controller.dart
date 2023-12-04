import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var navIndex = 0.obs;
  @override
  void onInit() {
    getUsername();
    super.onInit();
  }

  var currentNavIndex = 0.obs;

  var username = '';

  getUsername() async {
    var n = await firestore
        .collection(usersCollection)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.first['name'];
      }
    });

    username = n;
  }
}
