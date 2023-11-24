import 'package:ecommerce_flutter_app/seller_screen/const/const.dart';

Widget normalText({
  text,
  color = Colors.white,
  size = 14.0,
}) {
  return "$text".text.color(color).make();
}

Widget boldText({
  text,
  color = Colors.white,
  size = 14.0,
}) {
  return "$text".text.semiBold.color(color).size(size).make();
}
