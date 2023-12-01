// ignore_for_file: avoid_print, await_only_futures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isloading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //signup method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storing data method
  // storeUserData({name, password, email}) async {
  //   DocumentReference store =
  //       await firestore.collection(usersCollection).doc(currentUser!.uid);
  //   store.set({
  //     'name': name,
  //     'password': password,
  //     'email': email,
  //     'imageUrl': '',
  //     'id': currentUser!.uid,
  //     'cart_count': "00",
  //     'wishlist_count': "00",
  //     'order_count': "00"
  //   });
  // }
  storeUserData({name, password, email}) async {
    if (currentUser != null) {
      DocumentReference store =
          await firestore.collection(usersCollection).doc(currentUser!.uid);
      store.set({
        'name': name,
        'password': password,
        'email': email,
        'imageUrl': '',
        'id': currentUser!.uid,
        'cart_count': "00",
        'wishlist_count': "00",
        'order_count': "00"
      });
    } else {
      // Trường hợp currentUser là null, tạo một người dùng mới
      try {
        var authResult = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        if (authResult.user != null) {
          // Người dùng đã được tạo thành công, lưu thông tin người dùng
          DocumentReference store = await firestore
              .collection(usersCollection)
              .doc(authResult.user!.uid);
          store.set({
            'name': name,
            'password': password,
            'email': email,
            'imageUrl': '',
            'id': authResult.user!.uid,
            'cart_count': "00",
            'wishlist_count': "00",
            'order_count': "00"
          });
        } else {
          // Xử lý trường hợp không thể tạo người dùng mới
          print('Lỗi: Không thể tạo người dùng mới.');
        }
      } catch (e) {
        // Xử lý lỗi khi tạo người dùng mới
        print('Lỗi: $e');
      }
    }
  }

  //signout Method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}

// class AuthController extends GetxController {
//   var isloading = false.obs;

//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();

//   // Xác định trạng thái người dùng hiện tại
//   var currentUser = Rxn<User>();

//   @override
//   void onInit() {
//     // The listener để theo dõi thay đổi trong trạng thái đăng nhập của người dùng
//     ever(currentUser, handleAuthState);
//     super.onInit();
//   }

//   // Hàm xử lý thay đổi trong trạng thái đăng nhập của người dùng
//   void handleAuthState(User? user) {
//     // Kiểm tra nếu người dùng đã đăng nhập hoặc đã đăng xuất
//     if (user != null) {
//       // Người dùng đã đăng nhập, xử lý các hành động liên quan
//       print('Đăng nhập với email: ${user.email}');
//     } else {
//       // Người dùng đã đăng xuất, xử lý các hành động liên quan
//       print('Đăng xuất');
//       // Xóa dữ liệu người dùng hiện tại
//       clearUserData();
//       Get.offAll(() => const LoginScreen());
//     }
//   }

//   // Hàm để đăng nhập
//   Future<UserCredential?> loginMethod({context}) async {
//     UserCredential? userCredential;

//     try {
//       userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text, password: passwordController.text);
//     } on FirebaseAuthException catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//     return userCredential;
//   }

//   // Hàm để đăng ký
//   Future<UserCredential?> signupMethod({email, password, context}) async {
//     UserCredential? userCredential;

//     try {
//       userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//     return userCredential;
//   }

//   // Hàm để lưu dữ liệu người dùng
//   storeUserData({name, password, email}) async {
//     if (currentUser.value != null) {
//       DocumentReference store = await FirebaseFirestore.instance
//           .collection(usersCollection)
//           .doc(currentUser.value!.uid);
//       store.set({
//         'name': name,
//         'password': password,
//         'email': email,
//         'imageUrl': '',
//         'id': currentUser.value!.uid,
//         'cart_count': "00",
//         'wishlist_count': "00",
//         'order_count': "00"
//       });
//     } else {
//       // Trường hợp currentUser là null, tạo một người dùng mới
//       try {
//         var authResult = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: email, password: password);

//         if (authResult.user != null) {
//           // Người dùng đã được tạo thành công, lưu thông tin người dùng
//           DocumentReference store = await FirebaseFirestore.instance
//               .collection(usersCollection)
//               .doc(authResult.user!.uid);
//           store.set({
//             'name': name,
//             'password': password,
//             'email': email,
//             'imageUrl': '',
//             'id': authResult.user!.uid,
//             'cart_count': "00",
//             'wishlist_count': "00",
//             'order_count': "00"
//           });
//         } else {
//           // Xử lý trường hợp không thể tạo người dùng mới
//           print('Lỗi: Không thể tạo người dùng mới.');
//         }
//       } catch (e) {
//         // Xử lý lỗi khi tạo người dùng mới
//         print('Lỗi: $e');
//       }
//     }
//   }

//   // Hàm để đăng xuất
//   signoutMethod(context) async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       Get.offAll(() => const LoginScreen());
//     } catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//   }

//   // Hàm để xóa dữ liệu người dùng khi đăng xuất
//   void clearUserData() {
//     emailController.clear();
//     passwordController.clear();
//     // Đặt giá trị của currentUser là null
//     currentUser.value = null;
//   }
// }
