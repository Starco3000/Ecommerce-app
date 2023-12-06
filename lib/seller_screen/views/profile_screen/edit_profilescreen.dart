// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/controllers/profile_controller.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/bg_widget.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/loading_indicator.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/mainbutton_widget.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/textfield_widget.dart';

import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
      context,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: whiteColor),
            )),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          //If data Image url and controller path is Empty
                          data?['imageUrl'] == '' &&
                                  controller.profileImgPath.isEmpty
                              ? Image.asset(imgProfile2,
                                      width: 100, fit: BoxFit.cover)
                                  .box
                                  .roundedFull
                                  .clip(Clip.antiAlias)
                                  .make()
                              //If data is not empty but controller path is empty
                              : controller.snapshotData['imageUrl'] != '' &&
                                      controller.profileImgPath.isEmpty
                                  ? Image.network(
                                      controller.snapshotData['imageUrl'],
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make()
                                  //if both are empty
                                  : Image.file(
                                      File(controller.profileImgPath.value),
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                      .box
                                      .roundedFull
                                      .clip(Clip.antiAlias)
                                      .make(),
                          Positioned(
                            right: -6,
                            bottom: 0,
                            child: SizedBox(
                              height: 34,
                              width: 34,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.zero),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    side: MaterialStateProperty.all<BorderSide>(
                                        const BorderSide(color: whiteColor)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFFF5F6F9)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            dartgreyColor),
                                  ),
                                  onPressed: () {
                                    controller.changeImage(context);
                                  },
                                  child: const Icon(Icons.camera_alt_outlined)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                // mainButtonWidget(
                //     color: primaryColor,
                //     onPress: () {
                //       controller.changeImage(context);
                //     },
                //     textColor: whiteColor,
                //     title: "Change"),
                const Divider(),
                20.heightBox,
                TextFieldWidget(
                    controller: controller.nameController,
                    hint: nameHint,
                    title: name,
                    obscureText: false),
                TextFieldWidget(
                    controller: controller.oldpassController,
                    hint: passHint,
                    title: oldpass,
                    obscureText: true),
                TextFieldWidget(
                    controller: controller.newpassController,
                    hint: passHint,
                    title: newpass,
                    obscureText: true),
                controller.isloading.value
                    ? loadingIndicator()
                    : SizedBox(
                        width: context.screenWidth - 40,
                        child: mainButtonWidget(
                            color: primaryColor,
                            onPress: () async {
                              controller.isloading(true);

                              //if Image is not selected
                              if (controller.profileImgPath.value.isNotEmpty) {
                                await controller.uploadProfileImage();
                              } else {
                                controller.profileImageLink = data['imageUrl'];
                              }
                              // if old password match database
                              if (data['password'] ==
                                  controller.oldpassController.text) {
                                await controller.changeAuthPassword(
                                    email: data['email'],
                                    password: controller.oldpassController.text,
                                    newpassword:
                                        controller.newpassController.text);

                                await controller.updateProfile(
                                    imgUrl: controller.profileImageLink,
                                    name: controller.nameController.text,
                                    password:
                                        controller.newpassController.text);
                                VxToast.show(context, msg: "Uploaded");
                              } else {
                                VxToast.show(context,
                                    msg: "Wrong old password");
                                controller.isloading(false);
                              }
                            },
                            textColor: whiteColor,
                            title: "Save Change"),
                      ),
              ],
            )
                .box
                .white
                .shadowSm
                .padding(const EdgeInsets.all(16))
                .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
                .rounded
                .make(),
          ),
        ),
      ),
    );
  }
}
