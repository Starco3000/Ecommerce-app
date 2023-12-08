// ignore_for_file: unused_local_variable

import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/product_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/featured_catetory.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/featured_product.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/other_product.dart';
import 'package:get/get.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return Container(
      color: Colors.grey[300],
      child: Column(
        children: [
          // Featured categories
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.white, // Màu nền của Container
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, // Màu của đổ bóng
                  blurRadius: 2.0, // Độ mờ của đổ bóng
                  offset: Offset(0,
                      2), // Vị trí tạo đổ bóng, dương dọc là xuống, dương ngang là qua phải
                ),
              ],
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: popularProduct.text
                      .color(dartgreyColor)
                      .size(18)
                      .fontFamily(semibold)
                      .make(),
                ),
                20.heightBox,
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        // featuredCategory(
                        //     countItem: 3,
                        //     image: featuredImages1,
                        //     title: featuredTitles1),
                        // featuredCategory(
                        //     countItem: 3,
                        //     image: featuredImages2,
                        //     title: featuredTitles2),
                        featuredProducts(
                            fontTitle: semibold,
                            colorTitle: dartgreyColor,
                            fontPrice: bold,
                            colorPrice: primaryColor),
                      ],
                    )),
              ],
            ),
          ),
          10.heightBox,

          //featured product
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(12),
            width: context.screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    featuredProduct.text.white
                        .fontFamily(bold)
                        .fontWeight(FontWeight.w600)
                        .size(20)
                        .make(),
                    10.widthBox,
                    Image.asset(
                      icFlashSale,
                      width: 30,
                      height: 30,
                    )
                  ],
                ),
                10.heightBox,
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      featuredProducts(
                          fontTitle: semibold,
                          colorTitle: dartgreyColor,
                          fontPrice: bold,
                          colorPrice: primaryColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
          10.heightBox,

          //All products section
          Container(
            color: Colors.grey[300],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 45,
                  width: context.screenWidth,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: "Recommend Products"
                      .text
                      .color(primaryColor)
                      .fontFamily(bold)
                      .fontWeight(FontWeight.w600)
                      .size(22)
                      .make(),
                ).box.white.make(),
                otherProduct(
                  column: 2,
                  mainAxis: 8,
                  crossAxis: 8,
                  itemHeight: 300,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
