import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/auth_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/auth_screen/signup_screen.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/home.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/applogo_widget.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/bg_widget.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/loading_indicator.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/mainbutton_widget.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/textfield_widget.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/auth_screen/seller_login.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var controller = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //text controllers
    return bgWidget(context,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
              child: Center(
            child: Form(
              key: formKey,
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

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldWidget(
                                title: email,
                                hint: emailHint,
                                obscureText: false,
                                controller: controller.emailController),
                            TextFieldWidget(
                                title: password,
                                hint: passHint,
                                obscureText: true,
                                controller: controller.passwordController),
                          ],
                        ),
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
                                    .color(
                                        const Color.fromRGBO(33, 150, 243, 1))
                                    .make(),
                              ),

                              // Switch to seller
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginSeller()),
                                  );
                                },
                                child: seller.text.color(Colors.blue).make(),
                              ),
                            ]),
                        const SizedBox(height: 15),

                        // Login button
                        controller.isloading.value
                            ? loadingIndicator()
                            : mainButtonWidget(
                                color: primaryColor,
                                textColor: whiteColor,
                                title: login,
                                onPress: () async {
                                  if (formKey.currentState!.validate()) {
                                    controller.isloading(true);
                                    await controller
                                        .loginMethod(context: context)
                                        .then((value) {
                                      if (value != null) {
                                        VxToast.show(context, msg: loggedin);
                                        Get.offAll(() => const Home());
                                      } else {
                                        controller.isloading(false);
                                      }
                                    });
                                  } else {
                                    // Display error message if form is invalid
                                    VxToast.show(context,
                                        msg: 'Please enter valid information');
                                  }
                                  // Get.to(() => const Home());
                                }).box.width(context.screenWidth - 50).make(),
                        const SizedBox(height: 5),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            createNewAccount.text.color(greyColor).make(),
                            const SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen()),
                                );
                              },
                              child: signup.text.color(Colors.blue).make(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        anotherLogin.text.color(Colors.grey[500]).make(),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              3,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundColor: lightGreyColor,
                                      radius: 25,
                                      child: Image.asset(
                                        socialIconList[index],
                                        width: 30,
                                      ),
                                    ),
                                  )),
                        )
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
            ),
          )),
        ));
  }
}
