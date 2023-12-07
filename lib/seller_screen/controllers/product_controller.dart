import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/seller_screen/models/category_model.dart';
import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProductsController extends GetxController {
  var isloading = false.obs;
  var is_sale = false.obs;
  //text field controller
  var pnameController = TextEditingController();
  var pdescController = TextEditingController();
  var ppriceController = TextEditingController();
  var pquantityController = TextEditingController();

  var categoryList = <String>[].obs;
  var subcategoryList = <String>[].obs;
  List<Category> category = [];
  var pImagesList = RxList<dynamic>.generate(3, (index) => null);
  var pImagesLinks = [];
  var categoryvalue = ''.obs;
  var subcategoryvalue = ''.obs;
  var selectedColorIndex = 0.obs;
  var newImagesList = List<File?>.filled(3, null);

  getCategories() async {
    var data = await rootBundle
        .loadString("lib/seller_screen/services/category_model.json");
    var cat = categoryModelFromJson(data);
    category = cat.categories;
  }

  populateCategoryList() {
    categoryList.clear();
    for (var item in category) {
      categoryList.add(item.name);
    }
  }

  populateSubcategory(cat) {
    subcategoryList.clear();
    var data = category.where((element) => element.name == cat).toList();
    if (data.isNotEmpty) {
      for (var i = 0; i < data.first.subcategory.length; i++) {
        subcategoryList.add(data.first.subcategory[i]);
      }
    }
  }

  pickImage(index, context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (img == null) {
        return;
      } else {
        pImagesList[index] = File(img.path);
      }
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  void pickEditImage(index, context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (img == null) {
        return;
      } else {
        newImagesList[index] = File(img.path);
      }
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadImages() async {
    pImagesLinks.clear();
    for (var item in pImagesList) {
      if (item != null) {
        var filename = basename(item.path);
        var destination = 'images/$filename';
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n = await ref.getDownloadURL();
        pImagesLinks.add(n);
      }
    }
  }

  uploadProduct(context) async {
    var store = firestore.collection(productsCollection).doc();
    await store.set({
      'is_featured': false,
      'p_category': categoryvalue.value,
      'p_subcategory': subcategoryvalue.value,
      'p_colors': FieldValue.arrayUnion([Colors.red.value]),
      'p_imgs': FieldValue.arrayUnion(pImagesLinks),
      'p_wishlist': FieldValue.arrayUnion([]),
      'p_desc': pdescController.text,
      'p_name': pnameController.text,
      'p_price': ppriceController.text,
      'p_quantity': pquantityController.text,
      'p_seller': '',
      'vendor_id': currentUser?.uid,
      'featured_id': '',
      'p_rating': '2.0',
      'is_sale': false
    });
    isloading(false);
    VxToast.show(context, msg: "Product uploaded");
  }

  updateProduct(String docId, BuildContext context) async {
    var store = firestore.collection(productsCollection).doc(docId);
    await store.update({
      'p_category': categoryvalue.value,
      'p_subcategory': subcategoryvalue.value,
      'p_desc': pdescController.text,
      'p_name': pnameController.text,
      'p_price': ppriceController.text,
      'p_quantity': pquantityController.text,
      'vendor_id': currentUser?.uid,
      'p_imgs': FieldValue.arrayUnion(pImagesLinks),
    });
    VxToast.show(context, msg: "Product updated");
  }

  removeProduct(docId) async {
    await firestore.collection(productsCollection).doc(docId).delete();
  }

  addFeature(docId) async {
    await firestore.collection(productsCollection).doc(docId).set(
        {'featured_id': currentUser!.uid, 'is_featured': true},
        SetOptions(merge: true));
  }

  removeFeature(docId) async {
    await firestore.collection(productsCollection).doc(docId).set(
        {'featured_id': '', 'is_featured': false}, SetOptions(merge: true));
  }

  void setInitialValues(dynamic productData) {
    pnameController.text = productData['p_name'];
    pdescController.text = productData['p_desc'];
    ppriceController.text = productData['p_price'];
    pquantityController.text = productData['p_quantity'];
    // thêm các trường khác nếu cần
  }

  void setInitialImages(List<String> imageUrls) {
    for (var i = 0; i < imageUrls.length; i++) {
      pImagesList[i] = imageUrls[i];
    }
  }

  changeStatus({title, status, docID}) async {
    var store = firestore.collection(productsCollection).doc(docID);
    await store.set({title: status}, SetOptions(merge: true));
  }
}
