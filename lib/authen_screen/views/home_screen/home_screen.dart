import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/home_action_icon.dart';

import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/home_content.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/home_swiper.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/search_bar.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final dynamic data;
  const HomeScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Data in HomeActionIcon: $data");
    // return Container(
    //   padding: const EdgeInsets.all(12),
    //   color: lightGreyColor,
    //   width: context.screenWidth,
    //   height: context.screenHeight,
    //   child: SafeArea(
    //       child: Column(
    //     children: [
    //       //Seacrh bar
    //       searchBar(),
    //       10.heightBox,
    //       Expanded(
    //         child: SingleChildScrollView(
    //           physics: const BouncingScrollPhysics(),
    //           child: Column(
    //             children: [
    //               //Swipers brands
    //               swiperWidget(slider: sliderList, height: 150),
    //               10.heightBox,

    //               //deals Button
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: List.generate(
    //                     2,
    //                     (index) => homeButton(
    //                           height: context.screenHeight * 0.15,
    //                           width: context.screenWidth / 2.5,
    //                           icon: index == 0 ? icTodaysDeal : icFlashDeal,
    //                           title: index == 0 ? todayDeal : flashSale,
    //                         )),
    //               ),
    //               10.heightBox,

    //               // 2nd Swiper
    //               swiperWidget(slider: secondSliderList, height: 150),
    //               10.heightBox,

    //               //category button
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 children: List.generate(
    //                     3,
    //                     (index) => homeButton(
    //                           height: context.screenHeight * 0.13,
    //                           width: context.screenWidth / 3.5,
    //                           icon: index == 0
    //                               ? icTopCategories
    //                               : index == 1
    //                                   ? icBrands
    //                                   : icTopSeller,
    //                           title: index == 0
    //                               ? topCategories
    //                               : index == 1
    //                                   ? brand
    //                                   : topSeallers,
    //                         )),
    //               ),
    //               10.heightBox,

    //               //Featured categories
    //               Align(
    //                 alignment: Alignment.centerLeft,
    //                 child: featuredCategories.text
    //                     .color(dartgreyColor)
    //                     .size(18)
    //                     .fontFamily(semibold)
    //                     .make(),
    //               ),
    //               20.heightBox,

    //               SingleChildScrollView(
    //                   scrollDirection: Axis.horizontal,
    //                   child: Column(
    //                     children: [
    //                       featuredCategory(
    //                           countItem: 3,
    //                           image: featuredImages1,
    //                           title: featuredTitles1),
    //                       featuredCategory(
    //                           countItem: 3,
    //                           image: featuredImages2,
    //                           title: featuredTitles2),
    //                     ],
    //                   )),
    //               20.heightBox,

    //               //featured product
    //               Container(
    //                 padding: const EdgeInsets.all(12),
    //                 width: double.infinity,
    //                 decoration: const BoxDecoration(color: primaryColor),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     featuredProduct.text.white
    //                         .fontFamily(bold)
    //                         .size(18)
    //                         .make(),
    //                     10.heightBox,
    //                     SingleChildScrollView(
    //                       scrollDirection: Axis.horizontal,
    //                       child: Column(
    //                         children: [
    //                           featuredProducts(
    //                               itemCount: 6,
    //                               image: imgB1,
    //                               width: 130,
    //                               title: "Laptop 8GB/64GB",
    //                               fontTitle: semibold,
    //                               colorTitle: dartgreyColor,
    //                               price: "\$600",
    //                               fontPrice: bold,
    //                               colorPrice: primaryColor),
    //                         ],
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               20.heightBox,

    //               //Third swiper
    //               swiperWidget(slider: secondSliderList, height: 150),
    //               Container(height: 20),

    //               //All products section
    //               otherProduct(
    //                   itemCount: 6,
    //                   column: 2,
    //                   mainAxis: 8,
    //                   crossAxis: 8,
    //                   itemHeight: 300,
    //                   itemImage: imgP5,
    //                   itemTitle: "Laptop 4GB/64GB",
    //                   itemPrice: "\$600")
    //             ],
    //           ),
    //         ),
    //       )
    //     ],
    //   )),
    // );

    // return Scaffold(
    //   body: ListView(
    //     padding: const EdgeInsets.all(0),
    //     shrinkWrap: true,
    //     children: [
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height * 0.27,
    //         child: Swiper(
    //           itemBuilder: (BuildContext context, int index) {
    //             return Image.asset(
    //               sliderList[index],
    //               fit: BoxFit.fill,
    //             );
    //           },
    //           autoplay: true,
    //           itemCount: sliderList.length,
    //           pagination: const SwiperPagination(
    //               alignment: Alignment.bottomCenter,
    //               builder: DotSwiperPaginationBuilder(
    //                   color: whiteColor, activeColor: primaryColor)),
    //           // control: SwiperControl(color: Colors.black),
    //         ),
    //       ),
    //       Container(
    //         // padding: const EdgeInsets.all(8.0),
    //         color: Colors.grey[200],
    //         child: Column(
    //           children: [
    //             // Featured categories
    //             Container(
    //               padding: const EdgeInsets.all(8.0),
    //               decoration: const BoxDecoration(
    //                 color: Colors.white, // Màu nền của Container
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.grey, // Màu của đổ bóng
    //                     blurRadius: 2.0, // Độ mờ của đổ bóng
    //                     offset: Offset(0,
    //                         2), // Vị trí tạo đổ bóng, dương dọc là xuống, dương ngang là qua phải
    //                   ),
    //                 ],
    //               ),
    //               child: Column(
    //                 children: [
    //                   Align(
    //                     alignment: Alignment.centerLeft,
    //                     child: featuredCategories.text
    //                         .color(dartgreyColor)
    //                         .size(18)
    //                         .fontFamily(semibold)
    //                         .make(),
    //                   ),
    //                   20.heightBox,
    //                   SingleChildScrollView(
    //                       scrollDirection: Axis.horizontal,
    //                       child: Column(
    //                         children: [
    //                           featuredCategory(
    //                               countItem: 3,
    //                               image: featuredImages1,
    //                               title: featuredTitles1),
    //                           featuredCategory(
    //                               countItem: 3,
    //                               image: featuredImages2,
    //                               title: featuredTitles2),
    //                         ],
    //                       )),
    //                 ],
    //               ),
    //             ),
    //             10.heightBox,
    //             //featured product
    //             Container(
    //               padding: const EdgeInsets.all(12),
    //               width: double.infinity,
    //               decoration: const BoxDecoration(color: whiteColor),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   featuredProduct.text
    //                       .color(primaryColor)
    //                       .fontFamily(bold)
    //                       .size(18)
    //                       .make(),
    //                   10.heightBox,
    //                   SingleChildScrollView(
    //                     physics: const BouncingScrollPhysics(),
    //                     scrollDirection: Axis.horizontal,
    //                     child: Column(
    //                       children: [
    //                         featuredProducts(
    //                             itemCount: 6,
    //                             image: imgB1,
    //                             width: 130,
    //                             title: "Laptop 8GB/64GB",
    //                             fontTitle: semibold,
    //                             colorTitle: dartgreyColor,
    //                             price: "\$600",
    //                             fontPrice: bold,
    //                             colorPrice: primaryColor),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             10.heightBox,
    //             //All products section
    //             Container(
    //               padding:
    //                   const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
    //               color: whiteColor,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(
    //                         vertical: 8, horizontal: 8),
    //                     child: "Recommend Product"
    //                         .text
    //                         .color(primaryColor)
    //                         .fontFamily(bold)
    //                         .size(18)
    //                         .make(),
    //                   ),
    //                   10.heightBox,
    //                   otherProduct(
    //                       itemCount: 12,
    //                       column: 2,
    //                       mainAxis: 8,
    //                       crossAxis: 8,
    //                       itemHeight: 300,
    //                       itemImage: imgP5,
    //                       itemTitle: "Laptop 4GB/64GB",
    //                       itemPrice: "\$600"),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
    // final ScrollController _scrollController = ScrollController();
    // var controller = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: whiteColor,
      body: NestedScrollView(
        // controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                automaticallyImplyLeading: false,
                title: const HomeSearchBar(),
                actions: [
                  HomeActionIcon(
                    data: data,
                  )
                ],
                backgroundColor:
                    innerBoxIsScrolled ? whiteColor : Colors.transparent,
                pinned: true,
                // actions: const [HomeSearchBar()],
              ),
            ),
          ];
        },
        body: ListView(
          shrinkWrap: true,
          children: const [
            HomeSwiper(),
            HomeContent(),
          ],
        ),
      ),
    );
  }
}
