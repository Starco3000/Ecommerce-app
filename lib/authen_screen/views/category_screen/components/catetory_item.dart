import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/product_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/product_details_screen.dart';
import 'package:get/get.dart';

class CatetoryItemProduct extends StatelessWidget {
  final dynamic data;
  const CatetoryItemProduct({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return Expanded(
      child: Container(
        color: lightGreyColor,
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 280),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    data[index]['p_imgs'][0],
                    height: 150,
                    width: 150,
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
                  )
                ],
              )
                  .box
                  .white
                  .roundedSM
                  .outerShadowSm
                  .margin(const EdgeInsets.symmetric(horizontal: 4))
                  .padding(const EdgeInsets.all(12))
                  .make()
                  .onTap(() {
                controller.checkIfFav(data[index]);
                Get.to(() => ProductDetailsScreen(
                      title: "${data[index]['p_name']}",
                      data: data[index],
                    ));
              });
            }),
      ),
    );
  }
}
