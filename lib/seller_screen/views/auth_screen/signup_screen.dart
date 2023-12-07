// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/controllers/auth_controller.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/home_screen/home.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/applogo_widget%20copy.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/bg_widget.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/loading_indicator.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/mainbutton_widget.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var retypePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(context,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
              child: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Welcome to $appName"
                    .text
                    .fontFamily(bold)
                    .fontWeight(FontWeight.w800)
                    .white
                    .size(30)
                    .make(),
                10.heightBox,

                //Text Field
                Obx(
                  () => Column(
                    children: [
                      "Resiger".text.fontFamily(bold).black.size(25).make(),
                      10.heightBox,
                      TextFieldWidget(
                          title: name,
                          hint: nameHint,
                          controller: nameController,
                          obscureText: false),
                      TextFieldWidget(
                          title: email,
                          hint: emailHint,
                          controller: emailController,
                          obscureText: false),
                      TextFieldWidget(
                          title: password,
                          hint: passHint,
                          controller: passwordController,
                          obscureText: true),
                      TextFieldWidget(
                          title: retypePassword,
                          hint: passHint,
                          controller: retypePasswordController,
                          obscureText: true),
                      15.heightBox,

                      // Privacy Policy
                      Row(
                        children: [
                          Checkbox(
                            activeColor: primaryColor,
                            checkColor: whiteColor,
                            value: isCheck,
                            onChanged: (newValue) {
                              setState(() {
                                isCheck = newValue;
                              });
                            },
                          ),
                          10.widthBox,
                          Expanded(
                            child: RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                      fontFamily: regular,
                                      color: dartgreyColor)),
                              TextSpan(
                                text: termAndCond,
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: primaryColor,
                                ),
                              ),
                              TextSpan(
                                text: " & ",
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: primaryColor,
                                ),
                              ),
                              TextSpan(
                                text: privacyPolicy,
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: primaryColor,
                                ),
                              )
                            ])),
                          )
                        ],
                      ),

                      // Login button
                      controller.isloading.value
                          ? loadingIndicator()
                          : mainButtonWidget(
                              color: isCheck == true
                                  ? primaryColor
                                  : Colors.grey[400],
                              textColor: whiteColor,
                              title: signup,
                              onPress: () async {
                                if (isCheck != false) {
                                  controller.isloading(true);
                                  try {
                                    await controller
                                        .signupMethod(
                                            context: context,
                                            email: emailController.text,
                                            password: passwordController.text)
                                        .then((value) {
                                      return controller.storeUserData(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          name: nameController.text);
                                    }).then((value) {
                                      VxToast.show(context, msg: loggedin);
                                      Get.offAll(() => const SellerHome());
                                    });
                                  } catch (e) {
                                    auth.signOut();
                                    VxToast.show(context, msg: e.toString());
                                    controller.isloading(false);
                                  }
                                }
                              }).box.width(context.screenWidth - 50).make(),
                      5.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          loginAccount.text.color(greyColor).make(),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: login.text.color(Colors.blue).make(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
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
