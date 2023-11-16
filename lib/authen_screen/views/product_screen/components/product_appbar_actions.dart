import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/cart_screen/cart_screen.dart';
import 'package:get/get.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: whiteColor.withOpacity(0.8),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: dartgreyColor,
            ),
          ),
        ),
        5.widthBox,
        CircleAvatar(
          backgroundColor: whiteColor.withOpacity(0.8),
          child: IconButton(
            onPressed: () {
              Get.to(() => const CartScreen(),
                  arguments: 'fromProductDetailScreen');
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: dartgreyColor,
            ),
          ),
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.favorite_outline,
        //     color: dartgreyColor,
        //   ),
        // ),
        5.widthBox,
        CircleAvatar(
          backgroundColor: whiteColor.withOpacity(0.8),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
              color: dartgreyColor,
            ),
          ),
        ),
        5.widthBox
      ],
    );
  }
}
