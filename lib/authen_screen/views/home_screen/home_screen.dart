import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/featured_catetory.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/featured_product.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/other_product.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/search_bar.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/swiper_build.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/home_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGreyColor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
          child: Column(
        children: [
          //Seacrh bar
          searchBar(),
          10.heightBox,
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //Swipers brands
                  swiperWidget(slider: sliderList, height: 150),
                  10.heightBox,

                  //deals Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        2,
                        (index) => homeButton(
                              height: context.screenHeight * 0.15,
                              width: context.screenWidth / 2.5,
                              icon: index == 0 ? icTodaysDeal : icFlashDeal,
                              title: index == 0 ? todayDeal : flashSale,
                            )),
                  ),
                  10.heightBox,

                  // 2nd Swiper
                  swiperWidget(slider: secondSliderList, height: 150),
                  10.heightBox,

                  //category button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (index) => homeButton(
                              height: context.screenHeight * 0.13,
                              width: context.screenWidth / 3.5,
                              icon: index == 0
                                  ? icTopCategories
                                  : index == 1
                                      ? icBrands
                                      : icTopSeller,
                              title: index == 0
                                  ? topCategories
                                  : index == 1
                                      ? brand
                                      : topSeallers,
                            )),
                  ),
                  10.heightBox,

                  //Featured categories
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
                  20.heightBox,

                  //featured product
                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: const BoxDecoration(color: primaryColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        featuredProduct.text.white
                            .fontFamily(bold)
                            .size(18)
                            .make(),
                        10.heightBox,
                        SingleChildScrollView(
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
                            ))
                      ],
                    ),
                  ),
                  20.heightBox,

                  //Third swiper
                  swiperWidget(slider: secondSliderList, height: 150),
                  Container(height: 20),

                  //All products section
                  otherProduct(
                      itemCount: 6,
                      column: 2,
                      mainAxis: 8,
                      crossAxis: 8,
                      itemHeight: 300,
                      itemImage: imgP5,
                      itemTitle: "Laptop 4GB/64GB",
                      itemPrice: "\$600")
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
