import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/product_screen/components/product_slider.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/mainbutton_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String? title;
  const ProductDetailsScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.color(dartgreyColor).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: dartgreyColor,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: dartgreyColor,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
                color: dartgreyColor,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_outlined,
                color: dartgreyColor,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  productSlider(),
                  10.heightBox,
                  title!.text
                      .size(16)
                      .color(dartgreyColor)
                      .fontFamily(bold)
                      .make()
                ],
              ),
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Icon(
                      Icons.chat_outlined,
                      color: primaryColor,
                    ),
                    "Chat Now".text.color(dartgreyColor).make()
                  ],
                )
                    .box
                    .padding(
                        const EdgeInsets.symmetric(vertical: 9, horizontal: 16))
                    .make(),
                Container(
                    width: 1,
                    height: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.grey),
                Column(
                  children: [
                    const Icon(
                      Icons.shopping_cart_checkout_outlined,
                      color: primaryColor,
                    ),
                    "Put into Cart".text.color(dartgreyColor).make()
                  ],
                )
                    .box
                    .padding(
                        const EdgeInsets.symmetric(vertical: 9, horizontal: 16))
                    .make(),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 60,
                    child: mainButtonWidget(
                      color: primaryColor,
                      title: "Buy Now",
                      textColor: whiteColor,
                      onPress: () {},
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
