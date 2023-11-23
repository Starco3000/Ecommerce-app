import 'package:ecommerce_flutter_app/seller_screen/const/const.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';

Widget customTextField({lable, hint, controller, isDesc = false}) {
  return TextFormField(
    controller: controller,
    maxLines: isDesc ? 4 : 1,
    decoration: InputDecoration(
      isDense: true,
      label: normalText(text: lable),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: white,
          )),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Vx.white)),
      hintText: hint,
    ),
  );
}
