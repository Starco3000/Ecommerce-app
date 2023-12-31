// import 'package:ecommerce_flutter_app/seller_screen/consts/consts.dart';
// import 'package:ecommerce_flutter_app/seller_screen/controllers/auth_controller.dart';
// import 'package:ecommerce_flutter_app/seller_screen/views/auth_screen/seller_login.dart';
// import 'package:ecommerce_flutter_app/seller_screen/views/auth_screen/signup_screen.dart';
// import 'package:ecommerce_flutter_app/seller_screen/views/home_screen/home.dart';
// import 'package:ecommerce_flutter_app/seller_screen/views/widgets/applogo_widget%20copy.dart';
// import 'package:ecommerce_flutter_app/seller_screen/views/widgets/bg_widget.dart';
// import 'package:ecommerce_flutter_app/seller_screen/views/widgets/loading_indicator.dart';
// import 'package:ecommerce_flutter_app/seller_screen/views/widgets/mainbutton_widget.dart';
// import 'package:ecommerce_flutter_app/seller_screen/views/widgets/textfield_widget.dart';
// import 'package:get/get.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(AuthSellerController());

//     //text controllers

//     return bgWidget(context,
//         child: Scaffold(
//           resizeToAvoidBottomInset: false,
//           body: SingleChildScrollView(
//               child: Center(
//             child: Column(
//               children: [
//                 (context.screenHeight * 0.1).heightBox,
//                 applogoWidget(),
//                 const SizedBox(height: 10),
//                 "Welcome to $appName"
//                     .text
//                     .fontFamily(bold)
//                     .fontWeight(FontWeight.w800)
//                     .white
//                     .size(30)
//                     .make(),
//                 10.heightBox,
//                 Obx(
//                   () => Column(
//                     children: [
//                       "Login".text.fontFamily(bold).black.size(25).make(),
//                       10.heightBox,

//                       TextFieldWidget(
//                           title: email,
//                           hint: emailHint,
//                           obscureText: false,
//                           controller: controller.emailController),
//                       TextFieldWidget(
//                           title: password,
//                           hint: passHint,
//                           obscureText: true,
//                           controller: controller.passwordController),
//                       5.heightBox,
//                       Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // ForgetPass
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const SignupScreen()),
//                                 );
//                               },
//                               child: forgetPass.text
//                                   .color(const Color.fromRGBO(33, 150, 243, 1))
//                                   .make(),
//                             ),

//                             // Switch to seller
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const SellerLogin()),
//                                 );
//                               },
//                               child: seller.text.color(Colors.blue).make(),
//                             ),
//                           ]),
//                       const SizedBox(height: 15),

//                       // Login button
//                       controller.isloading.value
//                           ? loadingIndicator()
//                           : mainButtonWidget(
//                               color: primaryColor,
//                               textColor: whiteColor,
//                               title: login,
//                               onPress: () async {
//                                 controller.isloading(true);
//                                 await controller
//                                     .loginMethod(context: context)
//                                     .then((value) {
//                                   if (value != null) {
//                                     VxToast.show(context, msg: loggedin);
//                                     Get.off(() => const SellerHome());
//                                   } else {
//                                     controller.isloading(false);
//                                   }
//                                 });
//                                 // Get.to(() => const Home());
//                               }).box.width(context.screenWidth - 50).make(),
//                       const SizedBox(height: 5),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           createNewAccount.text.color(greyColor).make(),
//                           const SizedBox(width: 5),
//                           InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const SignupScreen()),
//                               );
//                             },
//                             child: signup.text.color(Colors.blue).make(),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       anotherLogin.text.color(Colors.grey[500]).make(),
//                       const SizedBox(height: 5),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: List.generate(
//                             3,
//                             (index) => Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: CircleAvatar(
//                                     backgroundColor: lightGreyColor,
//                                     radius: 25,
//                                     child: Image.asset(
//                                       socialIconList[index],
//                                       width: 30,
//                                     ),
//                                   ),
//                                 )),
//                       )
//                     ],
//                   )
//                       .box
//                       .white
//                       .rounded
//                       .padding(const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 25))
//                       .margin(const EdgeInsets.symmetric(vertical: 15))
//                       .width(context.screenWidth - 70)
//                       .shadowSm
//                       .make(),
//                 ),
//               ],
//             ),
//           )),
//         ));
//   }
// }
