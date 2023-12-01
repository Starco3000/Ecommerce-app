import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/services/firestore_services.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/product_details_screen.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/loading_indicator.dart';
import 'package:get/get.dart';

class SearchResultScreen extends StatelessWidget {
  final String? title;
  const SearchResultScreen({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: chatBgColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: title!.text.color(dartgreyColor).make(),
        ),
        body: FutureBuilder(
            future: FirestoreServices.searchProducts(title),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: loadingIndicator(),
                );
              } else if (snapshot.data!.docs.isNotEmpty) {
                return "No Products found"
                    .text
                    .color(dartgreyColor)
                    .makeCentered();
              } else {
                var data = snapshot.data!.docs;
                var filtered = data
                    .where((element) => element['p_name']
                        .toString()
                        .toLowerCase()
                        .contains(title!.toLowerCase()))
                    .toList();

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                  child: GridView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            mainAxisExtent: 300),
                    children: filtered
                        .mapIndexed(
                          (currentValue, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(
                                filtered[index]['p_imgs'][0],
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
                                    "${filtered[index]['p_name']}"
                                        .text
                                        .fontFamily(semibold)
                                        .color(dartgreyColor)
                                        .size(16)
                                        .make(),
                                    Row(
                                      children: [
                                        const Icon(Icons.star,
                                            color: golden, size: 18),
                                        4.widthBox,
                                        "${filtered[index]['p_rating']}"
                                            .text
                                            .fontFamily(semibold)
                                            .color(greyColor)
                                            .size(14)
                                            .make(),
                                        4.widthBox,
                                        "(${filtered[index]['p_quantity']})"
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
                                        "${filtered[index]['p_price']}"
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
                              .outerShadowSm
                              .padding(const EdgeInsets.all(4))
                              .roundedSM
                              .make()
                              .onTap(
                            () {
                              Get.to(() => ProductDetailsScreen(
                                    title: "${filtered[index]['p_name']}",
                                    data: filtered[index],
                                  ));
                            },
                          ),
                        )
                        .toList(),
                  ),
                );
              }
            }));
  }
}
