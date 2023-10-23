import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/auth_screen/signup_screen.dart';

import 'package:ecommerce_flutter_app/authen_screen/widgets/applogo_widget.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/bg_widget.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/mainbutton_widget.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/textfield_widget.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/home_screen/home.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                const SizedBox(height: 10),
                "Welcome to $appName"
                    .text
                    .fontFamily(bold)
                    .fontWeight(FontWeight.w800)
                    .white
                    .size(30)
                    .make(),
                const SizedBox(height: 10),
                Column(
                  children: [
                    "Login".text.fontFamily(bold).black.size(25).make(),
                    const SizedBox(height: 10),
                    textFieldWidget(hint: emailHint, title: email),
                    textFieldWidget(hint: passHint, title: password),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()),
                          );
                        },
                        child: forgetPass.text.color(Colors.blue).make(),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Login button
                    mainButtonWidget(
                        color: primaryColor,
                        textColor: whiteColor,
                        title: login,
                        onPress: () {
                          Get.to(() => const Home());
                        }).box.width(context.screenWidth - 50).make(),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        createNewAccount.text.color(greyColor).make(),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()),
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
              ],
            ),
          )),
        ));
  }
}
