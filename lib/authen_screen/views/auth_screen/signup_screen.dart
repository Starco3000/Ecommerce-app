import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/auth_screen/login_screen.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/applogo_widget.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/bg_widget.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/mainbutton_widget.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/textfield_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;

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

                //Text Field
                Column(
                  children: [
                    "Resiger".text.fontFamily(bold).black.size(25).make(),
                    const SizedBox(height: 10),
                    textFieldWidget(hint: nameHint, title: name),
                    textFieldWidget(hint: emailHint, title: email),
                    textFieldWidget(hint: passHint, title: password),
                    textFieldWidget(hint: passHint, title: retypePassword),
                    const SizedBox(height: 15),

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
                                    fontFamily: regular, color: dartgreyColor)),
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
                    mainButtonWidget(
                            color:
                                isCheck == true ? primaryColor : lightGreyColor,
                            textColor: whiteColor,
                            title: signup,
                            onPress: () {})
                        .box
                        .width(context.screenWidth - 50)
                        .make(),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        loginAccount.text.color(greyColor).make(),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: signup.text.color(Colors.blue).make(),
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
              ],
            ),
          )),
        ));
  }
}
