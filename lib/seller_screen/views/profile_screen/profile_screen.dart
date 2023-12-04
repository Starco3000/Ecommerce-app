// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/controllers/auth_controller.dart';
import 'package:ecommerce_flutter_app/seller_screen/services/store_services.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/auth_screen/login_screen.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/loading_indicator.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: boldText(text: settings, size: 16.0),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          TextButton(
              onPressed: () async {
                await Get.find<AuthController>().signoutMethod(context);
                Get.off(() => LoginScreen());
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
                leading: Image.asset(imgProduct)
                    .box
                    .roundedFull
                    .clip(Clip.antiAlias)
                    .make(),
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
                            leading: Icon(
                              profileButtonsIcons[index],
                              color: white,
                            ),
                            title: normalText(text: profileButtonsIcons[index]),
                          )),
                ),
              ),
            ]);
          }
        },
      ),
      // body: Column(children: [
      //   ListTile(
      //     leading: Image.asset(imgProduct)
      //         .box
      //         .roundedFull
      //         .clip(Clip.antiAlias)
      //         .make(),
      //     title: boldText(text: "Vendor name"),
      //     subtitle: normalText(text: "thang@gmail.com"),
      //   ),
      //   Divider(),
      //   10.heightBox,
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       children: List.generate(
      //           profileButtonsIcons.length,
      //           (index) => ListTile(
      //                 leading: Icon(
      //                   profileButtonsIcons[index],
      //                   color: white,
      //                 ),
      //                 title: normalText(text: profileButtonsIcons[index]),
      //               )),
      //     ),
      //   ),
      // ]),
    );
  }
}
