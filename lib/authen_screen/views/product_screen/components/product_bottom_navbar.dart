import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/mainbutton_widget.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              "Chat Now".text.color(dartgreyColor).make(),
            ],
          )
              .box
              .padding(const EdgeInsets.symmetric(vertical: 9, horizontal: 16))
              .make(),
          Container(
            width: 1,
            height: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey,
          ),
          Column(
            children: [
              const Icon(
                Icons.shopping_cart_checkout_outlined,
                color: primaryColor,
              ),
              "Put into Cart".text.color(dartgreyColor).make(),
            ],
          )
              .box
              .padding(const EdgeInsets.symmetric(vertical: 9, horizontal: 16))
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
    );
  }
}
