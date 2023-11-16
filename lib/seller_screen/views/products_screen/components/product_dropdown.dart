import 'package:ecommerce_flutter_app/seller_screen/const/const.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';

Widget productDropdown() {
  return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
    value: null,
    hint: normalText(text: "choose caterory", color: fontGrey),
    isExpanded: true,
    items: const [],
    onChanged: (Value) {},
  )
          .box
          .white
          .padding(const EdgeInsets.symmetric(horizontal: 4))
          .border(color: Vx.black)
          .roundedSM
          .make());
}
