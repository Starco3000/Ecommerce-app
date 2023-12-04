import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';

class StoreServices {
  static getProducts(uid) {
    return firestore.collection(productsCollection).snapshots();
  }

  static getProfile(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .get();
  }

  //Get products according to category

  //Get cart
  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  //delete item from cart
  static deleteItem(itemId) {
    return firestore.collection(cartCollection).doc(itemId).delete();
  }

  //Get all chat messages
  static getChatMessages(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy("created_on", descending: false)
        .snapshots();
  }

  static getCounts() async {
    var res = await Future.wait([
      firestore
          .collection(cartCollection)
          .where('added_by', isEqualTo: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      firestore
          .collection(productsCollection)
          .where('p_wishlist', arrayContains: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      firestore
          .collection(ordersCollection)
          .where('order_by', arrayContains: currentUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      })
    ]);
    return res;
  }
}
