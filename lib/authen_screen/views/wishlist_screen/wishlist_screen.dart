import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/product_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/services/firestore_services.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/product_details_screen.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/loading_indicator.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return Scaffold(
      backgroundColor: chatBgColor,
      appBar: AppBar(
          backgroundColor: whiteColor,
          title: "My Wishlist"
              .text
              .color(dartgreyColor)
              .fontFamily(semibold)
              .make()),
      body: StreamBuilder(
        stream: FirestoreServices.getAllWishlists(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            // return "No wishlist yet!".text.color(dartgreyColor).makeCentered();
            return Center(
              child: Image.asset(imgEmptyWishlist),
            );
          } else {
            var data = snapshot.data!.docs;
            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2,
                            mainAxisExtent: 330),
                    itemBuilder: (context, index) {
                      // return ListTile(
                      //   leading: Image.network(
                      //     "${data[index]['img'][0]}",
                      //     width: 80,
                      //     fit: BoxFit.cover,
                      //   ),
                      //   title:
                      //       "${data[index]['p_name']} (x${data[index]['quantity']})"
                      //           .text
                      //           .fontFamily(semibold)
                      //           .size(16)
                      //           .make(),
                      //   subtitle: "${data[index]['p_price']}"
                      //       .numCurrency
                      //       .text
                      //       .color(primaryColor)
                      //       .fontFamily(semibold)
                      //       .make(),
                      //   trailing:
                      //       const Icon(Icons.favorite, color: primaryColor)
                      //           .onTap(() async {
                      //     await firestore
                      //         .collection(productsCollection)
                      //         .doc(data[index].id)
                      //         .set({
                      //       'p_wishlish':
                      //           FieldValue.arrayRemove([currentUser!.uid])
                      //     }, SetOptions(merge: true));
                      //   }),
                      // );
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            data[index]['p_imgs'][0],
                            height: 180,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                          5.heightBox,
                          "${data[index]['p_name']}"
                              .text
                              .fontFamily(semibold)
                              .color(dartgreyColor)
                              .size(16)
                              .make(),
                          5.heightBox,
                          Row(
                            children: [
                              const Icon(Icons.star, color: golden, size: 18),
                              4.widthBox,
                              "${data[index]['p_rating']}"
                                  .text
                                  .fontFamily(semibold)
                                  .color(greyColor)
                                  .size(14)
                                  .make(),
                              4.widthBox,
                              "(${data[index]['p_quantity']})"
                                  .text
                                  .color(greyColor)
                                  .size(14)
                                  .make()
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  "đ "
                                      .text
                                      .fontFamily(bold)
                                      .color(primaryColor)
                                      .size(16)
                                      .make(),
                                  "${data[index]['p_price']}"
                                      .numCurrency
                                      .text
                                      .color(primaryColor)
                                      .fontFamily(bold)
                                      .size(16)
                                      .make(),
                                ],
                              ),
                              GestureDetector(
                                onTap: () async {
                                  print(
                                      "Tapped on favorite icon for product ${data[index]['p_name']}");

                                  try {
                                    await firestore
                                        .collection(productsCollection)
                                        .doc(data[index].id)
                                        .set({
                                      'p_wishlist': FieldValue.arrayRemove(
                                          [currentUser!.uid])
                                    }, SetOptions(merge: true));

                                    print(
                                        "Product removed from wishlist successfully");
                                  } catch (e) {
                                    print(
                                        "Error removing product from wishlist: $e");
                                  }

                                  // Trigger a rebuild of the UI after removing from wishlist
                                  controller.update();
                                },
                                child: const Icon(Icons.favorite,
                                    color: primaryColor),
                              ),
                            ],
                          ),
                        ],
                      )
                          .box
                          .white
                          .roundedSM
                          .outerShadowSm
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .padding(const EdgeInsets.all(12))
                          .make()
                          .onTap(
                        () {
                          controller.checkIfFav(data[index]);
                          Get.to(
                            () => ProductDetailsScreen(
                              title: "${data[index]['p_name']}",
                              data: data[index],
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
