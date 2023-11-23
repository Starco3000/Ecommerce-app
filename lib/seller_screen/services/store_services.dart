import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';

class StoreServices {
  static getProducts(uid) {
    return firestore
        .collection(productsCollection)
        .where('vendor_id', isEqualTo: uid)
        .snapshots();
  }
}
