import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/cart_screen/cart_screen.dart';
import 'package:get/get.dart';

class HomeActionIcon extends StatelessWidget {
  final dynamic data;
  const HomeActionIcon({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
          onPressed: () {
            Get.to(() => const CartScreen(), arguments: 'fromHomeScreen');
          },
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: primaryColor,
            size: 28,
          )),
      IconButton(
          onPressed: () {
            // Get.to(
            //   () => const MessagesScreen(),
            //   arguments: [data['p_seller'], data['vender_id']],
            // );
          },
          icon: const Icon(
            Icons.message_rounded,
            color: primaryColor,
            size: 28,
          )),
    ]);
  }
}
