import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/profile_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/chat_screen/messaging_screen.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/orders_screen/orders_screen.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/profile_screen/profile_editing.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/wishlist_screen/wishlist_screen.dart';
import 'package:get/get.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key, this.data}) : super(key: key);

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return const Divider(color: lightGreyColor);
        },
        itemCount: profileButtonsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              switch (index) {
                case 0:
                  controller.nameController.text = data['name'];
                  Get.to(() => EditProfileScreen(data: data));
                  break;
                case 1:
                  Get.to(() => const WishlistScreen());
                  break;
                case 2:
                  Get.to(() => const MessagesScreen());
                  break;
                case 3:
                  Get.to(() => const OrdersScreen());
                  break;
              }
            },
            leading: Image.asset(profileButtonsIcon[index],
                width: 25, color: primaryColor),
            title: profileButtonsList[index]
                .text
                .fontFamily(regular)
                .color(dartgreyColor)
                .make(),
            trailing: Image.asset(icArrow, width: 30, color: primaryColor),
          );
        },
      ),
    );
  }
}
