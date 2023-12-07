import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/services/firestore_services.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/product_details_screen.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/loading_indicator.dart';
import 'package:get/get.dart';

Widget featuredProducts({fontTitle, colorTitle, fontPrice, colorPrice}) {
  return FutureBuilder(
    future: FirestoreServices.getFeaturedProducts(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return Center(child: loadingIndicator());
      } else if (snapshot.data!.docs.isEmpty) {
        return "No featured products".text.white.makeCentered();
      } else {
        var featuredData = snapshot.data!.docs;
        return Row(
          children: List.generate(
              featuredData.length,
              (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          featuredData[index]['p_imgs'][0],
                          width: 120,
                          height: 120,
                          fit: BoxFit.fill,
                        ),
                        20.heightBox,
                        "${featuredData[index]['p_name']}"
                            .text
                            .fontFamily(fontTitle)
                            .color(colorTitle)
                            .size(16)
                            .make(),
                        10.heightBox,
                        Row(
                          children: [
                            "đ"
                                .text
                                .fontFamily(semibold)
                                .size(16)
                                .color(primaryColor)
                                .make(),
                            3.widthBox,
                            "${featuredData[index]['p_price']}"
                                .numCurrency
                                .text
                                .fontFamily(fontPrice)
                                .color(colorPrice)
                                .size(16)
                                .make(),
                          ],
                        )
                      ],
                    )
                        .box
                        .white
                        .roundedSM
                        .padding(const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 6))
                        .make()
                        .onTap(() {
                      Get.to(() => ProductDetailsScreen(
                            title: "${featuredData[index]['p_name']}",
                            data: featuredData[index],
                          ));
                    }),
                  )),
        );
      }
    },
  );
}
