
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/auth_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/profile_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/auth_screen/login_screen.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/profile_screen/components/profile_details_card.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/profile_screen/components/profile_menu.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/profile_screen/profile_editing.dart';
import 'package:ecommerce_flutter_app/authen_screen/services/firestore_services.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return StreamBuilder(
      stream: FirestoreServices.getUser(currentUser!.uid),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(primaryColor)),
          );
        } else {
          var data = snapshot.data!.docs[0];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //user detail sections
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    data['imageUrl'] == ''
                        ?
                        // const ProfilePicture(),
                        Image.asset(imgProfile2, width: 80, fit: BoxFit.cover)
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make()
                        : Image.network(data['imageUrl'],
                                width: 80, fit: BoxFit.cover)
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make(),
                    15.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "${data['name']}"
                              .text
                              .fontFamily(semibold)
                              .white
                              .size(18)
                              .make(),
                          "${data['email']}".text.white.make(),
                        ],
                      ),
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: whiteColor)),
                        onPressed: () async {
                          await Get.put(AuthController())
                              .signoutMethod(context);
                          Get.offAll(() => const LoginScreen());
                        },
                        child: logout.text.fontFamily(semibold).white.make())
                  ],
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DetailsCard(count: data['cart_count'], title: "in your cart"),
                  DetailsCard(
                      count: data['wishlist_count'], title: "in your wishlist"),
                  DetailsCard(count: data['order_count'], title: "your orders"),
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
                          controller.nameController.text = data['name'];

                          Get.to(() => EditProfileScreen(data: data));
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
      },
    );
  }
}
