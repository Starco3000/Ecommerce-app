import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/featured_catetory.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/featured_product.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/other_product.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
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
                  child: featuredCategories.text
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
                        featuredCategory(
                            countItem: 3,
                            image: featuredImages1,
                            title: featuredTitles1),
                        featuredCategory(
                            countItem: 3,
                            image: featuredImages2,
                            title: featuredTitles2),
                      ],
                    )),
              ],
            ),
          ),
          10.heightBox,
          //featured product
          Container(
            padding: const EdgeInsets.all(12),
            width: context.screenWidth,
            decoration: const BoxDecoration(color: whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                featuredProduct.text
                    .color(primaryColor)
                    .fontFamily(bold)
                    .size(18)
                    .make(),
                10.heightBox,
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      featuredProducts(
                          itemCount: 6,
                          image: imgB1,
                          width: 130,
                          title: "Laptop 8GB/64GB",
                          fontTitle: semibold,
                          colorTitle: dartgreyColor,
                          price: "\$600",
                          fontPrice: bold,
                          colorPrice: primaryColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
          5.heightBox,
          //All products section
          Container(
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 40,
                  width: context.screenWidth,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: "Recommend Product"
                      .text
                      .color(primaryColor)
                      .fontFamily(bold)
                      .size(18)
                      .make(),
                ).box.white.make(),
                5.heightBox,
                otherProduct(
                    itemCount: 12,
                    column: 2,
                    mainAxis: 8,
                    crossAxis: 2,
                    itemHeight: 300,
                    itemImage: imgP5,
                    itemTitle: "Laptop 4GB/64GB",
                    itemPrice: "\$600"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
