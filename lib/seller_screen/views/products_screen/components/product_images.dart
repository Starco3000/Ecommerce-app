import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/const/const.dart';
import 'package:ecommerce_flutter_app/seller_screen/views/widgets/text_style.dart';

Widget ProductImage() {
  return boldText(text: "1", color: fontGrey, size: 16.0)
      .box
      .color(lightGrey)
      .size(100, 100)
      .roundedSM
      .make();
}
