import 'package:ecommerce_flutter_app/seller_screen/const/const.dart';
import 'package:ecommerce_flutter_app/seller_screen/controllers/product_controller.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';
import 'package:get/get.dart';

Widget productDropdown(
    hint, List<String> list, dropvalue, ProductsController controller) {
  return Obx(
    () => DropdownButtonHideUnderline(
        child: DropdownButton(
      value: dropvalue.value == '' ? null : dropvalue.value,
      hint: normalText(text: "$hint", color: fontGrey),
      isExpanded: true,
      items: list.map((e) {
        return DropdownMenuItem(value: e, child: e.toString().text.make());
      }).toList(),
      onChanged: (newValue) {
        if (hint == "Category") {
          controller.subcategoryvalue.value = '';
          controller.populateSubcategory(newValue.toString());
        }
        dropvalue.value = newValue.toString();
      },
    )
            .box
            .white
            .padding(const EdgeInsets.symmetric(horizontal: 4))
            .border(color: Vx.black)
            .roundedSM
            .make()),
  );
}
