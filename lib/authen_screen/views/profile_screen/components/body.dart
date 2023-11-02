import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/auth_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/auth_screen/login_screen.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/profile_screen/components/profile_details_card.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/profile_screen/components/profile_menu.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/profile_screen/components/profile_pic.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/profile_screen/profile_editing.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              const ProfilePicture(),
              15.widthBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Mummy User"
                        .text
                        .fontFamily(semibold)
                        .white
                        .size(18)
                        .make(),
                    "customer@exmaple.com".text.white.make(),
                  ],
                ),
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: whiteColor)),
                  onPressed: () async {
                    await Get.put(AuthController()).signoutMethod(context);
                    Get.offAll(() => const LoginScreen());
                  },
                  child: logout.text.fontFamily(semibold).white.make())
            ],
          ),
        ),
        20.heightBox,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DetailsCard(count: "00", title: "in your cart"),
            DetailsCard(count: "23", title: "in your wishlist"),
            DetailsCard(count: "00", title: "your orders"),
          ],
        ),
        20.heightBox,
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: whiteColor),
            child: Column(
              children: [
                ProfileMenu(
                  icon: icProfile,
                  text: "My Account",
                  press: () {
                    Get.to(() => const EditProfileScreen());
                  },
                ),
                ProfileMenu(
                  icon: icHeart,
                  text: "Wishlist",
                  press: () {},
                ),
                ProfileMenu(
                  icon: icMessages,
                  text: "Chat",
                  press: () {},
                ),
                ProfileMenu(
                  icon: icOrders,
                  text: "My orders",
                  press: () {},
                ),
                ProfileMenu(
                  icon: icCart,
                  text: "Cart",
                  press: () {},
                ),
                ProfileMenu(
                  icon: icGear,
                  text: "Settings",
                  press: () {},
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
