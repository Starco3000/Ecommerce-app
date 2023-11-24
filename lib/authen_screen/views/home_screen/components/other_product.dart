import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/services/firestore_services.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/product_details_screen.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/loading_indicator.dart';
import 'package:get/get.dart';

Widget otherProduct({
  column,
  double? mainAxis,
  double? crossAxis,
  double? itemHeight,
}) {
  return StreamBuilder(
      stream: FirestoreServices.allproducts(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return loadingIndicator();
        } else {
          var allproductsdata = snapshot.data!.docs;
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: allproductsdata.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: column,
                mainAxisSpacing: mainAxis ?? 4,
                crossAxisSpacing: crossAxis ?? 4,
                mainAxisExtent: itemHeight ?? 200),
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      allproductsdata[index]['p_imgs'][0],
                      height: 200,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "${allproductsdata[index]['p_name']}"
                              .text
                              .fontFamily(semibold)
                              .color(dartgreyColor)
                              .size(16)
                              .make(),
                          Row(
                            children: [
                              const Icon(Icons.star, color: golden, size: 18),
                              4.widthBox,
                              "${allproductsdata[index]['p_rating']}"
                                  .text
                                  .fontFamily(semibold)
                                  .color(greyColor)
                                  .size(14)
                                  .make(),
                              4.widthBox,
                              "(${allproductsdata[index]['p_quantity']})"
                                  .text
                                  .color(greyColor)
                                  .size(14)
                                  .make()
                            ],
                          ),
                          5.heightBox,
                          Row(
                            children: [
                              "đ"
                                  .text
                                  .fontFamily(semibold)
                                  .size(17)
                                  .color(primaryColor)
                                  .make(),
                              3.widthBox,
                              "${allproductsdata[index]['p_price']}"
                                  .numCurrency
                                  .text
                                  .color(primaryColor)
                                  .fontFamily(bold)
                                  .size(16)
                                  .make(),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
                    .box
                    .white
                    // .margin(const EdgeInsets.symmetric(horizontal: 4))
                    .padding(const EdgeInsets.all(4))
                    .make()
                    .onTap(() {
                  Get.to(() => ProductDetailsScreen(
                        title: "${allproductsdata[index]['p_name']}",
                        data: allproductsdata[index],
                      ));
                }),
              );
            },
          );
        }
      });
}
