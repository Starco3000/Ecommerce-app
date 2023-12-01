import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/product_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/featured_product.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/components/product_appbar_actions.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/components/product_bottom_navbar.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/components/product_rating.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/components/product_searchbar.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/components/product_slider.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String title;
  final dynamic data;
  const ProductDetailsScreen({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return WillPopScope(
      onWillPop: () async {
        controller.resetValues();
        return true;
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  automaticallyImplyLeading: false,
                  leading: Transform.scale(
                    scale: 0.7,
                    child: CircleAvatar(
                      backgroundColor: whiteColor.withOpacity(0.8),
                      radius: 10, // Đặt bán kính của nút
                      child: IconButton(
                        onPressed: () {
                          controller.resetValues();
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: dartgreyColor,
                          size: 30, // Đặt kích thước của biểu tượng
                        ),
                      ),
                    ),
                  ),
                  title: const ProductSearchBar(),
                  backgroundColor:
                      innerBoxIsScrolled ? whiteColor : Colors.transparent,
                  actions: const [AppBarActions()],
                  pinned: true,
                  // Thêm thuộc tính snap
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                ProductSlider(data: data),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Product name
                      title.text
                          .size(20)
                          .color(dartgreyColor)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      Row(
                        children: [
                          "đ"
                              .text
                              .color(primaryColor)
                              .fontFamily(bold)
                              .fontWeight(FontWeight.w500)
                              .size(22)
                              .make(),
                          "${data['p_price']}"
                              .numCurrency
                              .text
                              .color(primaryColor)
                              .fontFamily(bold)
                              .fontWeight(FontWeight.w500)
                              .size(22)
                              .make(),
                        ],
                      ),

                      // Product Rating and other Icon Actions
                      ProductRating(data: data),
                      5.heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Seller".text.white.fontFamily(semibold).make(),
                                5.heightBox,
                                "${data['p_seller']}"
                                    .text
                                    .color(dartgreyColor)
                                    .fontFamily(semibold)
                                    .size(16)
                                    .make(),
                              ],
                            ),
                          ),
                          const CircleAvatar(
                            backgroundColor: whiteColor,
                            child: Icon(Icons.message_rounded,
                                color: dartgreyColor),
                          )
                        ],
                      )
                          .box
                          .height(60)
                          .padding(const EdgeInsets.symmetric(horizontal: 16))
                          .color(textfieldColor)
                          .make(),

                      //Color.section
                      20.heightBox,
                      Obx(
                        () => Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: "Color: "
                                      .text
                                      .color(dartgreyColor)
                                      .make(),
                                ),
                                Row(
                                  children: List.generate(
                                    data['p_colors'].length,
                                    (index) => Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        VxBox()
                                            .size(40, 40)
                                            .roundedFull
                                            .color(
                                                Color(data['p_colors'][index])
                                                    .withOpacity(1.0))
                                            .margin(const EdgeInsets.symmetric(
                                                horizontal: 4))
                                            .make()
                                            .onTap(() {
                                          controller.changeColorIndex(index);
                                        }),
                                        Visibility(
                                          visible: index ==
                                              controller.colorIndex.value,
                                          child: const Icon(Icons.done,
                                              color: whiteColor),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),

                            //quality row
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: "Quantity: "
                                      .text
                                      .color(dartgreyColor)
                                      .make(),
                                ),
                                Obx(
                                  () => Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            controller.decreaseQuantity();
                                            controller.calculateTotalPrice(
                                                int.parse(data['p_price']));
                                          },
                                          icon: const Icon(Icons.remove)),
                                      controller.quantity.value.text
                                          .size(16)
                                          .color(dartgreyColor)
                                          .fontFamily(bold)
                                          .make(),
                                      IconButton(
                                          onPressed: () {
                                            controller.increaseQuantity(
                                                int.parse(data['p_quantity']));
                                            controller.calculateTotalPrice(
                                                int.parse(data['p_price']));
                                          },
                                          icon: const Icon(Icons.add)),
                                      10.heightBox,
                                      "(${data['p_quantity']} available)"
                                          .text
                                          .color(dartgreyColor)
                                          .make()
                                    ],
                                  ),
                                ),
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),

                            //total row
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: "Total: "
                                      .text
                                      .color(dartgreyColor)
                                      .make(),
                                ),
                                "${controller.totalPrice.value}"
                                    .numCurrency
                                    .text
                                    .color(primaryColor)
                                    .make(),
                              ],
                            ).box.padding(const EdgeInsets.all(8)).make(),
                          ],
                        ).box.white.shadowSm.make(),
                      ),

                      //description section
                      10.heightBox,
                      "Description"
                          .text
                          .color(dartgreyColor)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      "${data['p_desc']}".text.color(dartgreyColor).make(),

                      //Button  section
                      10.heightBox,
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(
                            productDetailButtonsList.length,
                            (index) => ListTile(
                                  title: productDetailButtonsList[index]
                                      .text
                                      .fontFamily(semibold)
                                      .color(dartgreyColor)
                                      .make(),
                                  trailing: const Icon(Icons.arrow_forward),
                                )),
                      ),

                      //Products may like section
                      20.heightBox,
                      productsyoumaylike.text
                          .fontFamily(bold)
                          .color(dartgreyColor)
                          .size(16)
                          .make(),

                      //
                      10.heightBox,
                      SingleChildScrollView(
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(data: data),
      ),
    );
  }
}
