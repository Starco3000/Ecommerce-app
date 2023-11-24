import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/cart_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/product_controller.dart';
import 'package:get/get.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Container(
      color: whiteColor,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              15.widthBox,
              "Total price: "
                  .text
                  .fontFamily(semibold)
                  .size(16)
                  .color(dartgreyColor)
                  .make(),
              5.widthBox,
              "đ"
                  .text
                  .color(primaryColor)
                  .fontFamily(bold)
                  .fontWeight(FontWeight.w500)
                  .size(16)
                  .make(),
              Obx(
                () => Text(
                  "${controller.totalPri.value}".numCurrency,
                  style: const TextStyle(
                      fontFamily: semibold, color: primaryColor, fontSize: 18),
                ),
              ),
            ],
          ),
          10.widthBox,
          SizedBox(
            height: 60,
            width: 140,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor)),
              onPressed: () {},
              child: "Buying".text.white.fontFamily(semibold).size(16).make(),
            ),
          ),
        ],
      ),
    );
  }
}
