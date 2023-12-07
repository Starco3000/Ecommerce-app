// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/controllers/auth_controller.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/auth_screen/login_screen.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/auth_screen/signup_screen.dart';

import 'package:ecommerce_flutter_app/seller_screen/views/widgets/applogo_widget%20copy.dart';

import 'package:ecommerce_flutter_app/seller_screen/views/home_screen/home.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/bg_widget.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/loading_indicator.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/mainbutton_widget.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class SellerLogin extends StatelessWidget {
  const SellerLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authController = Get.put(AuthController());

    //text controllers

    return bgWidget(context,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
              child: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                applogoWidget(),
                const SizedBox(height: 10),
                "Welcome to $appName"
                    .text
                    .fontFamily(bold)
                    .fontWeight(FontWeight.w800)
                    .white
                    .size(30)
                    .make(),
                10.heightBox,
                Obx(
                  () => Column(
                    children: [
                      "Login".text.fontFamily(bold).black.size(25).make(),
                      10.heightBox,

                      TextFieldWidget(
                          title: email,
                          hint: emailHint,
                          obscureText: false,
                          controller: authController.emailController),
                      TextFieldWidget(
                          title: password,
                          hint: passHint,
                          obscureText: true,
                          controller: authController.passwordController),
                      5.heightBox,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ForgetPass
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen()),
                                );
                              },
                              child: forgetPass.text
                                  .color(const Color.fromRGBO(33, 150, 243, 1))
                                  .make(),
                            ),

                            // Switch to user
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                              child: Auser.text.color(Colors.blue).make(),
                            ),
                          ]),
                      const SizedBox(height: 15),

                      // Login button
                      authController.isloading.value
                          ? loadingIndicator()
                          : mainButtonWidget(
                              color: primaryColor,
                              textColor: whiteColor,
                              title: login,
                              onPress: () async {
                                authController.isloading(true);
                                await authController
                                    .loginMethod(context: context)
                                    .then((value) async {
                                  if (value != null) {
                                    VxToast.show(context, msg: loggedin);
                                    authController.isloading(true);
                                    await authController
                                        .getUserType()
                                        .then((isSeller) async {
                                      if (isSeller) {
                                        Get.off(() => const SellerHome());
                                      } else {
                                        VxToast.show(context,
                                            msg:
                                                "Bạn không phải là người bán!");
                                        await Get.find<AuthController>()
                                            .signoutMethod(context);
                                        Get.off(() => LoginScreen());
                                      }
                                    });
                                  } else {
                                    authController.isloading(false);
                                  }
                                });
                              }).box.width(context.screenWidth - 50).make(),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              "If you have any problem, contact with adminitrator",
                              style: TextStyle(color: greyColor),
                            ),
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .padding(const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 25))
                      .margin(const EdgeInsets.symmetric(vertical: 15))
                      .width(context.screenWidth - 70)
                      .shadowSm
                      .make(),
                ),
              ],
            ),
          )),
        ));
  }
}
