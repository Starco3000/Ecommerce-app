import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';

class StoreServices {
  static getProducts(uid) {
    return firestore
        .collection(productsCollection)
        .where('vendor_id', isEqualTo: uid)
        .snapshots();
  }
}
