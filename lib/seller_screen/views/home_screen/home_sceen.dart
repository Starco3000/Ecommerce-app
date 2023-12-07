// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/services/store_services.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/products_screen/product_detail.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/appbar_widget.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/dashboard_button.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/loading_indicator.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: appbarWidget(dashboard),
        body: StreamBuilder(
            stream: StoreServices.getProducts(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return loadingIndicator();
              } else {
                var data = snapshot.data!.docs;
                data = data.sortedBy((a, b) =>
                    b['p_wishlist'].length.compareTo(a['p_wishlist'].length));
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            dashboardButton(context,
                                title: products,
                                count: "${data.length}",
                                icon: icProducts),
                            dashboardButton(context,
                                title: orders, count: "3", icon: icOrder)
                          ]),
                      10.heightBox,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            dashboardButton(context,
                                title: rating,
                                count: "${data.length}",
                                icon: icStar),
                            dashboardButton(context,
                                title: totalSalses,
                                count: "${data.length}",
                                icon: icOrder)
                          ]),
                      10.heightBox,
                      const Divider(),
                      10.heightBox,
                      boldText(text: popular, color: darkGrey, size: 16.0),
                      20.heightBox,
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                          data.length,
                          (index) => data[index]['p_wishlist'].length == 0
                              ? const SizedBox()
                              : ListTile(
                                  onTap: () {
                                    Get.to(() =>
                                        ProductDetails(data: data[index]));
                                  },
                                  leading: Image.network(
                                      data[index]['p_imgs'][0],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover),
                                  title: boldText(
                                      text: "${data[index]['p_name']}",
                                      color: fontGrey),
                                  subtitle: normalText(
                                      text: "\$${data[index]['p_price']}",
                                      color: darkGrey),
                                ),
                        ),
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
