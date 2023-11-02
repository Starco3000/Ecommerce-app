import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/components/featured_product.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/components/product_appbar_actions.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/components/product_bottom_navbar.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/components/product_slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String? title;
  const ProductDetailsScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: Text(
                  title!,
                  style: const TextStyle(color: dartgreyColor),
                ),
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
              ProductSlider(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Other content elements
                    title!.text
                        .size(16)
                        .color(dartgreyColor)
                        .fontFamily(semibold)
                        .make(),
                    // Other content elements
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldColor,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    10.heightBox,
                    "\$30,000"
                        .text
                        .color(primaryColor)
                        .fontFamily(bold)
                        .size(18)
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Seller".text.white.fontFamily(semibold).make(),
                              5.heightBox,
                              "In House Brands"
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
                          child:
                              Icon(Icons.message_rounded, color: dartgreyColor),
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
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Quantity: "
                                  .text
                                  .color(textfieldColor)
                                  .make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .make(),
                              ),
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),

                        //quality row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Color: ".text.color(textfieldColor).make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.remove)),
                                "0"
                                    .text
                                    .size(16)
                                    .color(dartgreyColor)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add)),
                                10.heightBox,
                                "() available)"
                                    .text
                                    .color(textfieldColor)
                                    .make()
                              ],
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),

                        //total row
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total: ".text.color(dartgreyColor).make(),
                            ),
                            "\$0.00".text.color(dartgreyColor).make(),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),

                    //description section
                    10.heightBox,
                    "Description"
                        .text
                        .color(dartgreyColor)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    "This is a dummy and funny description here... dawaaaaaaaaadrgard"
                        .text
                        .color(dartgreyColor)
                        .make(),

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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
