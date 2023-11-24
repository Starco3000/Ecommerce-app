import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/cart_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/shipping_screen/payment_method.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/mainbutton_widget.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: primaryColor)),
        title: "Shipping Info"
            .text
            .fontFamily(semibold)
            .color(dartgreyColor)
            .make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: mainButtonWidget(
            onPress: () {
              if (controller.addressController.text.length > 10) {
                Get.to(() => const PaymentMethods());
              } else {
                VxToast.show(context, msg: "Please fill this form");
              }
            },
            color: primaryColor,
            textColor: whiteColor,
            title: "Continue"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFieldWidget(
                hint: "Address",
                obscureText: false,
                title: "Address",
                controller: controller.addressController),
            TextFieldWidget(
                hint: "City",
                obscureText: false,
                title: "City",
                controller: controller.cityController),
            TextFieldWidget(
                hint: "State",
                obscureText: false,
                title: "State",
                controller: controller.stateController),
            TextFieldWidget(
                hint: "Postal Code",
                obscureText: false,
                title: "Postal Code",
                controller: controller.postalcodeController),
            TextFieldWidget(
                hint: "Phone",
                obscureText: false,
                title: "Phone",
                controller: controller.phoneController),
          ],
        ),
      ),
    );
  }
}
