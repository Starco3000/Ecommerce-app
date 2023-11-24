import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/controllers/cart_controller.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/home_screen/home.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/loading_indicator.dart';
import 'package:ecommerce_flutter_app/authen_screen/widgets/mainbutton_widget.dart';
import 'package:get/get.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Obx(
      () => Scaffold(
        backgroundColor: whiteColor,
        bottomNavigationBar: SizedBox(
          height: 60,
          child: controller.placingOrder.value
              ? Center(
                  child: loadingIndicator(),
                )
              : mainButtonWidget(
                  onPress: () async {
                    await controller.placeMyOrder(
                        orderPaymentMethod:
                            paymentMethods[controller.paymentIndex.value],
                        totalAmount: controller.totalPri.value);

                    await controller.clearCart();
                    VxToast.show(context, msg: "Order placed successfully");
                    Get.offAll(const Home());
                  },
                  color: primaryColor,
                  textColor: whiteColor,
                  title: "Continue"),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: primaryColor)),
          title: "Choose Payment Method"
              .text
              .fontFamily(semibold)
              .color(dartgreyColor)
              .make(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Obx(
            () => Column(
              children: List.generate(
                paymentMethodsImg.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      controller.changePaymentIndex(index);
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            style: BorderStyle.solid,
                            color: controller.paymentIndex.value == index
                                ? primaryColor
                                : Colors.transparent,
                            width: 3),
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.asset(
                            paymentMethodsImg[index],
                            width: double.infinity,
                            height: 120,
                            colorBlendMode:
                                controller.paymentIndex.value == index
                                    ? BlendMode.darken
                                    : BlendMode.color,
                            color: controller.paymentIndex.value == index
                                ? Colors.black.withOpacity(0.4)
                                : Colors.transparent,
                            fit: BoxFit.cover,
                          ),
                          controller.paymentIndex.value == index
                              ? Transform.scale(
                                  scale: 1.3,
                                  child: Checkbox(
                                    activeColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    value: true,
                                    onChanged: (value) {},
                                  ),
                                )
                              : Container(),
                          Positioned(
                              bottom: 0,
                              right: 10,
                              child: paymentMethods[index]
                                  .text
                                  .white
                                  .fontFamily(semibold)
                                  .size(16)
                                  .make()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
