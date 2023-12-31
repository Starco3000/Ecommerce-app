// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/controllers/auth_controller.dart';
import 'package:ecommerce_flutter_app/seller_screen/controllers/profile_controller.dart';
import 'package:ecommerce_flutter_app/seller_screen/services/store_services.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/auth_screen/seller_login.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/messages_screen/messages_screen.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/profile_screen/edit_profilescreen.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/loading_indicator.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';
import 'package:get/get.dart';

class ProfileSellerScreen extends StatelessWidget {
  const ProfileSellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileSellerController());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: boldText(text: settings, size: 16.0),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => EditProfileScreen());
              },
              icon: const Icon(
                Icons.edit,
                color: whiteColor,
              )),
          TextButton(
              onPressed: () async {
                await Get.find<AuthSellerController>().signoutMethod(context);
                Get.offAll(() => SellerLogin());
              },
              child: normalText(text: logout))
        ],
      ),
      body: FutureBuilder(
        future: StoreServices.getProfile(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs[0];
            return Column(children: [
              ListTile(
                leading:
                    data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                        ? Image.asset(imgProduct, width: 100)
                            .box
                            .roundedFull
                            .clip(Clip.antiAlias)
                            .make()
                        : Image.network(
                            data['imageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                title: boldText(text: "${data['name']}"),
                subtitle: normalText(text: "${data['email']}"),
              ),
              Divider(),
              10.heightBox,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: List.generate(
                      profileButtonsIcons.length,
                      (index) => ListTile(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  break;
                                case 1:
                                  Get.to(() => const MessagesScreen());
                              }
                            },
                            leading: Icon(
                              profileButtonsIcons[index],
                              color: white,
                            ),
                            title:
                                normalText(text: profileButtonsTitles[index]),
                          )),
                ),
              ),
            ]);
          }
        },
      ),
    );
  }
}
