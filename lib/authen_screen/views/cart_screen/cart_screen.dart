import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/cart_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/services/firestore_services.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/cart_screen/components/cart_bottomnavbar.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/components/product_bottom_navbar.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/product_details_screen.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/loading_indicator.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    var fromHomeScreen = Get.arguments == 'fromHomeScreen';
    var fromProductDetailScreen = Get.arguments == 'fromProductDetailScreen';
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: lightGreyColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: (fromHomeScreen || fromProductDetailScreen)
              ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: primaryColor),
                  onPressed: () {
                    Navigator.pop(context); // Trở lại màn hình trước đó
                  },
                )
              : null, // Ẩn nút back khi từ các trang khác tới
          backgroundColor: whiteColor,
          title: "Shopping Cart!"
              .text
              .color(dartgreyColor)
              .fontFamily(semibold)
              .make(),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getCart(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imgCartEmpty),
                    'Oops! Cart is empty'
                        .text
                        .color(primaryColor)
                        .fontFamily(bold)
                        .fontWeight(FontWeight.w600)
                        .size(26)
                        .make(),
                  ],
                ),
              );
            } else {
              var data = snapshot.data!.docs;
              controller.calculate(data);
              return Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                color: whiteColor,
                                child: ListTile(
                                  leading:
                                      Image.network("${data[index]['img']}"),
                                  title:
                                      "${data[index]['title']} (x${data[index]['quantity']})"
                                          .text
                                          .fontFamily(semibold)
                                          .size(16)
                                          .make(),
                                  subtitle: "${data[index]['totalPrice']}"
                                      .numCurrency
                                      .text
                                      .color(primaryColor)
                                      .fontFamily(semibold)
                                      .make(),
                                  trailing: const Icon(Icons.delete,
                                          color: primaryColor)
                                      .onTap(() {
                                    FirestoreServices.deleteItem(
                                        data[index].id);
                                  }),
                                ),
                              );
                            })),
                    CartBottomNavBar()
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
