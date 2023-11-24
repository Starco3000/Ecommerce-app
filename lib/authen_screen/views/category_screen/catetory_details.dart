import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/product_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/category_screen/components/catetory_item.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/bg_widget.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/loading_indicator.dart';
import 'package:ecommerce_flutter_app/authen_screen/services/firestore_services.dart';

import 'package:get/get.dart';

class CatetoryDetails extends StatelessWidget {
  final String? title;
  const CatetoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
      context,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: whiteColor,
                size: 22,
              )),
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getProducts(title),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: "No products found!"
                    .text
                    .white
                    .fontFamily(semibold)
                    .size(24)
                    .make(),
              );
            } else {
              var data = snapshot.data!.docs;

              return Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            controller.subcat.length,
                            (index) => "${controller.subcat[index]}"
                                .text
                                .size(12)
                                .fontFamily(semibold)
                                .color(dartgreyColor)
                                .makeCentered()
                                .box
                                .white
                                .rounded
                                .size(120, 60)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .make()),
                      ),
                    ),
                    20.heightBox,

                    //Items container
                    CatetoryItemProduct(data: data)
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
