import 'package:ecommerce_flutter_app/authen_screen/consts/consts.dart';
import 'package:ecommerce_flutter_app/seller_screen/const/const.dart';

Widget ProductImage({required label, onPress}) {
  return "$label"
      .text
      .bold
      .color(fontGrey)
      .size(16)
      .makeCentered()
      .box
      .color(lightGrey)
      .size(100, 100)
      .roundedSM
      .make();
}
