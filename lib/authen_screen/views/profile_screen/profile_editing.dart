import 'dart:io';

import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/profile_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/bg_widget.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/mainbutton_widget.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      context,
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profileImgPath.isEmpty
                  ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make()
                  : Image.file(
                      File(controller.profileImgPath.value),
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              mainButtonWidget(
                  color: primaryColor,
                  onPress: () {
                    controller.changeImage(context);
                  },
                  textColor: whiteColor,
                  title: "Change"),
              const Divider(),
              20.heightBox,
              TextFieldWidget(hint: nameHint, title: name, obscureText: false),
              TextFieldWidget(
                  hint: passHint, title: password, obscureText: true),
              SizedBox(
                width: context.screenWidth - 40,
                child: mainButtonWidget(
                    color: primaryColor,
                    onPress: () {},
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
    );
  }
}
