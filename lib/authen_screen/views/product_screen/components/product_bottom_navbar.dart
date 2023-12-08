import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/product_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/chat_screen/chat_screen.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/mainbutton_widget.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final dynamic data;
  const BottomNavBar({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(
                () => const ChatScreen(),
                arguments: [data['p_seller'], data['vendor_id']],
              );
            },
            child: Column(
              children: [
                const Icon(
                  Icons.chat_outlined,
                  color: primaryColor,
                ),
                "Chat Now".text.color(dartgreyColor).make(),
              ],
            )
                .box
                .padding(
                    const EdgeInsets.symmetric(vertical: 9, horizontal: 16))
                .make(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey,
          ),
          GestureDetector(
            onTap: () {
              if (controller.quantity.value > 0) {
                controller.addToCart(
                    color: data['p_colors'][controller.colorIndex.value],
                    context: context,
                    vendorID: data['vendor_id'],
                    img: data['p_imgs'][0],
                    quantity: controller.quantity.value,
                    sellername: data['p_seller'],
                    title: data['p_name'],
                    totalPrice: controller.totalPrice.value);
                VxToast.show(context, msg: "Added to Cart");
              } else {
                VxToast.show(context, msg: "At least one product required");
              }
            },
            child: Column(
              children: [
                const Icon(
                  Icons.shopping_cart_checkout_outlined,
                  color: primaryColor,
                ),
                "Put into Cart".text.color(dartgreyColor).make(),
              ],
            )
                .box
                .padding(
                    const EdgeInsets.symmetric(vertical: 9, horizontal: 16))
                .make(),
          ),
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
    );
  }
}
