import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/auth_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/auth_screen/login_screen.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/profile_screen/components/profile_details_card.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/profile_screen/components/profile_menu.dart';
import 'package:ecommerce_flutter_app/authen_screen/services/firestore_services.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/loading_indicator.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return StreamBuilder(
      stream: FirestoreServices.getUser(currentUser!.uid),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: loadingIndicator());
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
                        ? Image.asset(imgProfile2, width: 80, fit: BoxFit.cover)
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
                          await controller.signoutMethod(context);
                          Get.offAll(() => const LoginScreen());
                        },
                        child: logout.text.fontFamily(semibold).white.make())
                  ],
                ),
              ),
              20.heightBox,
              FutureBuilder(
                future: FirestoreServices.getCounts(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: loadingIndicator());
                  } else {
                    var countData = snapshot.data;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DetailsCard(
                            count: countData[0].toString(),
                            title: "in your cart"),
                        DetailsCard(
                            count: countData[1].toString(),
                            title: "in your wishlist"),
                        DetailsCard(
                            count: countData[2].toString(),
                            title: "your orders"),
                      ],
                    );
                  }
                },
              ),

              20.heightBox,
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: whiteColor),
                  child: ProfileMenu(data: data),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
