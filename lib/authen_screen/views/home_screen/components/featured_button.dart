import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/authen_screen/views/category_screen/catetory_details.dart';
import 'package:get/get.dart';

Widget featuredButton({String? title, String? icon}) {
  return Row(
    children: [
      Image.asset(icon!, width: 60, fit: BoxFit.fill),
      10.widthBox,
      title!.text.fontFamily(semibold).color(dartgreyColor).make()
    ],
  )
      .box
      .white
      .width(200)
      .margin(const EdgeInsets.symmetric(horizontal: 4))
      .padding(const EdgeInsets.all(4))
      .roundedSM
      .outerShadowSm
      .make()
      .onTap(() {
    Get.to(() => CatetoryDetails(title: title));
  });
}
